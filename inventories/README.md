# Debug Inventory

Use the following command to debug the inventory:

```bash
ansible-inventory --list --flush-cache
```

Flush cache is absolutely necessary in order to make sure we perform a fresh
request to the AWS API without using cache pre-detected inventory previously.
