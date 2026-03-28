# Hands-on Task: Run and Manage a "Hello Web App" (httpd)

**Name:** Ananya Karn  
**SAP ID:** 500125205  
**Batch:** B3 CCVT  
**Date:** 25 March 2026  

---

## Objective

Deploy and manage a simple Apache-based web server on Kubernetes and:
- Verify it is running
- Modify it
- Scale it
- Debug it

---

## Task 1: Deploy a Simple Web Application (Apache httpd)

### Step 1: Run a Pod

```bash
kubectl run apache-pod --image=httpd
```

**Check:**

```bash
kubectl get pods
```

### Step 2: Inspect Pod

```bash
kubectl describe pod apache-pod
```

**Focus:**
- Container image = `httpd`
- Ports (default 80)
- Events

### Step 3: Access the App

```bash
kubectl port-forward pod/apache-pod 8081:80
```

Open: [http://localhost:8081](http://localhost:8081)

> You should see the Apache default page — **"It works!"**

### Step 4: Delete Pod

```bash
kubectl delete pod apache-pod
```

**Insight:** Pod disappears permanently — no self-healing.

---

## Task 2: Convert to Deployment

### Step 5: Create Deployment

```bash
kubectl create deployment apache --image=httpd
```

**Check:**

```bash
kubectl get deployments
kubectl get pods
```

### Step 6: Expose Deployment

```bash
kubectl expose deployment apache --port=80 --type=NodePort
```

**Access again:**

```bash
kubectl port-forward service/apache 8082:80
```

Open: [http://localhost:8082](http://localhost:8082)

---

## Task 3: Modify Behavior

### Step 7: Scale Deployment

```bash
kubectl scale deployment apache --replicas=2
```

**Check:**

```bash
kubectl get pods
```

> **Observe:** Multiple pods running the same app.

### Step 8: Test Load Distribution (Basic)

Run `port-forward` again and refresh browser multiple times.

---

## Task 4: Debugging Scenario

### Step 9: Break the App

```bash
kubectl set image deployment/apache httpd=wrongimage
```

**Check:**

```bash
kubectl get pods
```

### Step 10: Diagnose

```bash
kubectl describe pod <pod-name>
```

**Look for:**
- `ImagePullBackOff`
- Error messages

### Step 11: Fix It

```bash
kubectl set image deployment/apache httpd=httpd
```

---

## Task 5: Explore Inside Container (Important Skill)

### Step 12: Exec into Pod

```bash
kubectl exec -it <pod-name> -- /bin/bash
```

**Now inside the container:**

```bash
ls /usr/local/apache2/htdocs
```

> This is where the web files are stored.

**Exit:**

```bash
exit
```

---

## Task 6: Observe Self-Healing

### Step 13: Delete One Pod

```bash
kubectl delete pod <one-pod-name>
```

**Watch:**

```bash
kubectl get pods -w
```

> **Insight:** Deployment recreates the pod automatically.

---

## Task 7: Cleanup

```bash
kubectl delete deployment apache
kubectl delete service apache
```

---

## Optional Challenge: Modify Container at Runtime

```bash
kubectl exec -it <pod-name> -- /bin/bash
echo "Hello from Kubernetes" > /usr/local/apache2/htdocs/index.html
```

Refresh the browser to see the updated page.

---

## Key Learnings

| Concept | Insight |
|---|---|
| **Pod vs Deployment** | Pod = temporary, no recovery. Deployment = production-ready, self-healing |
| **Port Forwarding** | Only for debugging, not for real exposure |
| **Service** | Stable access point, required for real applications |
| **Scaling** | Multiple Pods = better availability |
| **Debugging** | `kubectl describe` is your best friend |

---

## Kubernetes Commands Summary

### 1. Run & Basic Pod Management

| Command | Purpose |
|---|---|
| `kubectl run apache-pod --image=httpd` | Create a Pod (single Apache container) |
| `kubectl get pods` | List all Pods |
| `kubectl describe pod apache-pod` | Inspect Pod details |
| `kubectl delete pod apache-pod` | Delete Pod permanently |

### 2. Access Application

| Command | Purpose |
|---|---|
| `kubectl port-forward pod/apache-pod 8081:80` | Map local port 8081 → Pod port 80 |
| `kubectl port-forward service/apache 8082:80` | Access via Service |

### 3. Deployment Management

| Command | Purpose |
|---|---|
| `kubectl create deployment apache --image=httpd` | Create managed Deployment |
| `kubectl get deployments` | List Deployments |
| `kubectl expose deployment apache --port=80 --type=NodePort` | Expose app via Service |
| `kubectl delete deployment apache` | Delete Deployment |
| `kubectl delete service apache` | Delete Service |

### 4. Scaling & Load Handling

| Command | Purpose |
|---|---|
| `kubectl scale deployment apache --replicas=2` | Scale to multiple Pods |
| `kubectl get pods` | Verify scaling |

### 5. Debugging & Troubleshooting

| Command | Purpose |
|---|---|
| `kubectl set image deployment/apache httpd=wrongimage` | Break app intentionally |
| `kubectl describe pod <pod-name>` | Diagnose issue |
| `kubectl set image deployment/apache httpd=httpd` | Fix — restore correct image |

### 6. Working Inside Containers

| Command | Purpose |
|---|---|
| `kubectl exec -it <pod-name> -- /bin/bash` | Enter container shell |
| `ls /usr/local/apache2/htdocs` | View Apache web files |
| `exit` | Exit container |

### 7. Self-Healing Observation

| Command | Purpose |
|---|---|
| `kubectl delete pod <pod-name>` | Simulate failure |
| `kubectl get pods -w` | Watch live Pod recreation |

### 8. Background Process Management

| Command | Purpose |
|---|---|
| `kubectl port-forward ... &` | Run in background |
| `jobs` | List background jobs |
| `ps aux \| grep port-forward` | Find process by PID |
| `kill %1` / `kill <PID>` | Stop process |
| `pkill -f port-forward` | Kill all port-forward processes |
| `tmux new -s pf` | Better process handling with tmux |
