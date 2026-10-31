Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793437204;
	b=XvWHpYXYL3XzzWH43kdFsoAsKVL1adqkvxbXHsmoFPuMQ26JE1modHUtYrfn8yY5NBh8
	 S06j/4tGNWrntYMdFE2QjuuVBK7+KQ159BLPPlWwKIYGrygbmjEG+hClDikg2vLvhVoeq
	 J9wosQci8jhvaORzbtRnpZXoYCEbSvUU7fpPs5HYNegaC+t8FON8m37gLs/K8C3wq4bqa
	 zHNg2aWEW3ZU5r3QLJAnTSxspzeimeYw8/xzjWSV1oz7zMbeuR1Zy/VhMfVpW3On6MHu1
	 GJaqrsNyULrlUK71dJqxI+kgEXCtsg3ETHPf+alW5Srow0wcGlgsjHk/eSwR6w+50Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793437204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+sZ2SGBKL+wA+F9N/uPCteUC32WVd5RJNFGupXt8+xA=;
	b=mhq4EAHWfElBAUx74yIuUqUs6z5AuT7uERBM4k+++Zsf/YX1C9npP1aT64A1jDr8WF4t
	 Tn0IgoaKGzE21eRHVkFvdRMvvnBIY+BkVOb3kJ3j1O9bmZwIOc5JQ0J60NJtXBusxSTan
	 EqLnVpIgEWEf7EgOJXdfUoQpxLsJF/kA6bD+hsN5/T/NsGSS7ztKrHKCsxtiBPnhx2y3T
	 V21MhrP5uy+Vk3Fndrpm9PEkZQpXS2rUbETWW/Bnd4icc/MISOWjPL4lwVG720mgzWwmW
	 rCyD9iGxl1x95ldlrCn9Irhrz9rEqxMmvyVPQvvxp4hv/1gM5N5Z79SDIbM8r6JMdcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wLC4nbCN;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC0D606A31A
	for <linux-gpio@vger.kernel.org>; Sat, 31 Oct 2026 09:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AC0D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wLC4nbCN
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ea94541adbso6744625ad.2
        for <linux-gpio@vger.kernel.org>; Sat, 31 Oct 2026 02:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793437203; x=1794042003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+sZ2SGBKL+wA+F9N/uPCteUC32WVd5RJNFGupXt8+xA=;
        b=wLC4nbCNzS5Lc4pkvG+1R0lZT4CKRKMLrcJ3C7eYNgveSM4ha4ySCLJTKQctRIzj3q
         pp+KACA3l8OqyNhgTlNA24UEH0JkmomtWkd4Zl4Ixyf3DCuwSbqXpFh7REB+uNN94CD8
         46KwRIDy2yqHlHmQDz5dMvJsa3ZEQTg9YVyEZAMtZuq7b3HYXNBPkKJapl2yfAPeJzSk
         PCEtVj72AvkpDVsxtj2QQlHPD7e81GEHcBQZuHZcPZeVNplsA3nOOvBxYA5SrJ3vReKK
         +HkxaLToOyKReO41QPDuKw/FZtH7JVz9Hf0n4+ioOZvwNyiLer2CE5A0Ogt0bwJiG60S
         RCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793437203; x=1794042003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+sZ2SGBKL+wA+F9N/uPCteUC32WVd5RJNFGupXt8+xA=;
        b=VRL0EE1ZvK0tYNGxKG0ak/8E4S0TmWHKenJ2zK7oAJF1u09Nwa/rDSoVlea3xvXjrd
         JXxtRlW/KPRBf/jAmxzfANzoyOCMD609eiClCm8Lb3K3UwNi2nX60GvZvjl2QSKPfTbs
         pqVskeF7vFdqQgDJ+Sd3hwnPHi1L0CHb71PT4RgU3P55O18ut+rpiFOZzAOSM0vmcCyG
         3OoayJl+AALHx1hSDa+rqAYLsy1N/vbn31XWcL0okwGF/+HOt9JOWSFVuntFv/PjNY4B
         gnHkpjEQHM8eoj8JJLRmqbjHTQ7AR2pWfLS5v7jACsIAeOhUIWGVe5/yjVrsnBnC6nwL
         N39g==
X-Forwarded-Encrypted: i=1; AKwUvBwn5f3C/yYbFjx0JgZXOxfPi+MxJJeHIkA7q4Ha4hBqu668dPR00ddBcOiT8A298LhT7NSeCiHdkhF6@vger.kernel.org
X-Gm-Message-State: AFq9FYKpYKwvLWQinGtrjkweN0D3bb+ikJDEOCehHSO14lSuQ7+4QEYC
	MtoBsAXIKYfuidTUfXVWSS/e6yjHWeqo2ZpcQyRqw24qigAepeP8iMF3ak+4UA==
X-Gm-Gg: AYBFou2+3nBDzKoIQf3yEVw9PHZwhF2/MoD7hmjlkooXiXQAlP90V1+oO48Zm4qvHmH
	RYg8RQGuR5qsRjI5k8zljhO4KvQwRZtlSdkd0WsKuei+HmJrvRThy9QKfino3VhXDblY2hoOU0o
	T/07M6snN3zx4AvMjJHoaY70+BnhH5eRhxsHqRLT2dReYFQoP302Zg90ZkEzBpRg8f+/9UjHbQ3
	MCktABslNikJQ7IxqsySSuYhdOtb1qjiF/pr/o2aegjk0fuRG9zRT2ZQ0vj0gYYHqouMQ/5ge04
	5QOJQphjtnHFG+n0dp/FLwOCa4GhVmKFRkWxCiSdnkx9/9mmRZWZDcoej5UMu9NEhO/BnUqcO3o
	59FcDpKhNGRpOrQezPnczqvnRUNck5oh5GCgKXfOD+RAugj+su1U17BO41HB8Jh2Il5nOf7BYb4
	mnrPseIlEjGlGIni6H7lWS23OTpQ/Z5egRdzFV40fTe47CS8eR8xPIDUe9CLAVjaqZ0M3JOz8Ip
	2IDGEmQyje9ntfvTN+qtx7Zper6HtFE85BqB+jprlH8rljhvnPdR+txFwQm044XbJ2AAtGgyUON
	WeBk65xd87U29F9uk1y3A4Y2Ebxow/RCg5BtuKYhZpsD0Tu53wWFIcyAD0qGQEb/q0Y67YIA6cL
	BaAzv4DxpZ7aOu6W2mzNCZUfzj88gjhU5ANEfs2iAL362SSw3W0M4JdS6HpEbdnIFbDmr7870y8
	VycMLJuqG5QYlDIvThS+Sxq2q2
X-Received: by 2002:a17:902:d548:b0:2e2:d9fe:51fb with SMTP id d9443c01a7336-2eb363ffa94mr46855425ad.4.1793437202530;
        Sat, 31 Oct 2026 02:00:02 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392486bbsm13932775ad.30.2026.10.31.01.59.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 31 Oct 2026 02:00:01 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Koichiro Den <koichiro.den@canonical.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3] gpio: sim: fix the configfs lockup racing with mkdir/rmdir
Date: Sat, 31 Oct 2026 18:58:21 +1000
Message-ID: <20261031085821.23385-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261027085653.90471-1-yuz08559@gmail.com>
References: <20261027085653.90471-1-yuz08559@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpio_sim_device_lockup_configfs() depends (on activation) and undepends
(on deactivation) the leaf configfs entries of a device. It walks
dev->bank_list and bank->line_list without dev->lock, while the lists
are modified and their nodes freed under dev->lock by the configfs
make/release callbacks. It also walks the lists twice, once to depend
and once to undepend, and the two walks can see different entries:

 - A hog created while the device is live is never depended on, but
   it is undepended on deactivation, hitting
   BUG_ON(sd->s_dependent_count < 1) in configfs_undepend_item().
   The following is enough to trigger it:

	mkdir $G/dev $G/dev/bank0 $G/dev/bank0/line0
	echo 1 > $G/dev/live
	mkdir $G/dev/bank0/line0/hog
	echo 0 > $G/dev/live

 - An entry that is being created or removed when the device goes live
   cannot be depended on (the WARN_ON() fires), but it is undepended
   later, hitting the same BUG_ON(). If it has already been unlinked,
   configfs_depend_item_unlocked() dereferences its NULL ci_group.

Toggling "live" while concurrently creating and removing line and hog
directories hits the WARN_ON() and then the BUG_ON() within a second.

Hold the configfs subsystem mutex and dev->lock across the whole live
transition. The subsystem mutex is what configfs holds when it links
and unlinks entries and when it calls the make_group()/make_item()
callbacks, which then take dev->lock, so the lock order is the same.
Record the entries that were actually depended on and undepend exactly
those. If an entry cannot be depended on because it is being created
or removed, undo the dependencies already taken and fail with -EBUSY
instead of warning.

configfs_depend_item_unlocked() and configfs_undepend_item_unlocked()
only take configfs_dirent_lock for an item of the caller's own
subsystem, so calling them under these locks is fine.

Fixes: 8bd76b3d3f3a ("gpio: sim: lock up configfs that an instantiated device depends on")
Cc: stable@vger.kernel.org
Signed-off-by: Yu Zhang <yuz08559@gmail.com>
---
v3:
 - Count the lines with list_count_nodes() (Bartosz).
v2: https://lore.kernel.org/all/20261027085653.90471-1-yuz08559@gmail.com/
 - Supersedes v1 "gpio: sim: snapshot configfs leaf items before
   depending on them". The v1 approach of taking references on the
   entries and depending on them after dropping dev->lock still raced
   with mkdir/rmdir, as the sashiko review pointed out, so the fix
   was redone: hold the subsystem mutex and dev->lock across the whole
   live transition, record the entries that were depended on and fail
   with -EBUSY instead of warning.
v1: https://lore.kernel.org/all/20261026060049.60599-1-yuz08559@gmail.com/
---
 drivers/gpio/gpio-sim.c | 108 +++++++++++++++++++++++++++++++---------
 1 file changed, 84 insertions(+), 24 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 0c73bec..abc73bb 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -560,6 +560,10 @@ struct gpio_sim_device {
 	struct mutex lock;
 
 	struct list_head bank_list;
+
+	/* Leaf entries depended on while the device is live. */
+	struct config_item **deps;
+	unsigned int num_deps;
 };
 
 static struct gpio_sim_device *to_gpio_sim_device(struct config_item *item)
@@ -974,31 +978,80 @@ static void gpio_sim_device_deactivate(struct gpio_sim_device *dev)
 	gpio_sim_remove_swnode_recursive(swnode);
 }
 
-static void
-gpio_sim_device_lockup_configfs(struct gpio_sim_device *dev, bool lock)
+static void gpio_sim_device_unlock_configfs(struct gpio_sim_device *dev)
+{
+	unsigned int i;
+
+	lockdep_assert_held(&dev->lock);
+
+	for (i = 0; i < dev->num_deps; i++)
+		configfs_undepend_item_unlocked(dev->deps[i]);
+
+	kfree(dev->deps);
+	dev->deps = NULL;
+	dev->num_deps = 0;
+}
+
+static int gpio_sim_device_lockup_configfs(struct gpio_sim_device *dev)
 {
 	struct configfs_subsystem *subsys = dev->group.cg_subsys;
 	struct gpio_sim_bank *bank;
 	struct gpio_sim_line *line;
 	struct config_item *item;
+	unsigned int num = 0;
+	int ret;
+
+	lockdep_assert_held(&subsys->su_mutex);
+	lockdep_assert_held(&dev->lock);
 
 	/*
 	 * The device only needs to depend on leaf entries. This is
 	 * sufficient to lock up all the configfs entries that the
 	 * instantiated, alive device depends on.
+	 *
+	 * dev->lock keeps the bank and line lists stable and the subsystem
+	 * mutex keeps the entries' ci_group stable. An entry that is still
+	 * being created or removed cannot be depended on, in which case the
+	 * device is not brought up. The entries that were actually depended
+	 * on are recorded, so that exactly those are undepended when the
+	 * device goes down.
 	 */
+	list_for_each_entry(bank, &dev->bank_list, siblings)
+		num += list_count_nodes(&bank->line_list);
+
+	if (!num)
+		return 0;
+
+	dev->deps = kzalloc_objs(*dev->deps, num);
+	if (!dev->deps)
+		return -ENOMEM;
+
 	list_for_each_entry(bank, &dev->bank_list, siblings) {
 		list_for_each_entry(line, &bank->line_list, siblings) {
 			item = line->hog ? &line->hog->item
 					 : &line->group.cg_item;
 
-			if (lock)
-				WARN_ON(configfs_depend_item_unlocked(subsys,
-								      item));
-			else
-				configfs_undepend_item_unlocked(item);
+			/* Already unlinked by a concurrent rmdir(). */
+			if (!item->ci_group) {
+				ret = -EBUSY;
+				goto err_unlock;
+			}
+
+			ret = configfs_depend_item_unlocked(subsys, item);
+			if (ret) {
+				ret = -EBUSY;
+				goto err_unlock;
+			}
+
+			dev->deps[dev->num_deps++] = item;
 		}
 	}
+
+	return 0;
+
+err_unlock:
+	gpio_sim_device_unlock_configfs(dev);
+	return ret;
 }
 
 static ssize_t
@@ -1013,26 +1066,32 @@ gpio_sim_device_config_live_store(struct config_item *item,
 	if (ret)
 		return ret;
 
-	if (live)
-		gpio_sim_device_lockup_configfs(dev, true);
-
-	scoped_guard(mutex, &dev->lock) {
-		if (live == gpio_sim_device_is_live(dev))
-			ret = -EPERM;
-		else if (live)
-			ret = gpio_sim_device_activate(dev);
-		else
-			gpio_sim_device_deactivate(dev);
-	}
-
 	/*
-	 * Undepend is required only if device disablement (live == 0)
-	 * succeeds or if device enablement (live == 1) fails.
+	 * Lock order: subsystem mutex, then dev->lock. This is the same
+	 * order as in the make_group()/make_item() callbacks.
 	 */
-	if (live == !!ret)
-		gpio_sim_device_lockup_configfs(dev, false);
+	guard(mutex)(&dev->group.cg_subsys->su_mutex);
+	guard(mutex)(&dev->lock);
+
+	if (live == gpio_sim_device_is_live(dev))
+		return -EPERM;
+
+	if (live) {
+		ret = gpio_sim_device_lockup_configfs(dev);
+		if (ret)
+			return ret;
 
-	return ret ?: count;
+		ret = gpio_sim_device_activate(dev);
+		if (ret) {
+			gpio_sim_device_unlock_configfs(dev);
+			return ret;
+		}
+	} else {
+		gpio_sim_device_deactivate(dev);
+		gpio_sim_device_unlock_configfs(dev);
+	}
+
+	return count;
 }
 
 CONFIGFS_ATTR(gpio_sim_device_config_, live);
@@ -1546,6 +1605,7 @@ static void gpio_sim_device_config_group_release(struct config_item *item)
 
 	mutex_destroy(&dev->lock);
 	ida_free(&gpio_sim_ida, dev->id);
+	kfree(dev->deps);
 	kfree(dev);
 }
 
-- 
2.43.0

