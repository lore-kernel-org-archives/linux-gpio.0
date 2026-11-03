Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716327;
	b=z094lTlLN2wqsaAWDBgmO19Uldxv/VYxGXFdvUkLtpflRCkESnMHGzzRLFNeMKQg4WNR
	 RmiglMXnuKEibEuOkE1Zl3JPgMJafqEg3Paj/1W7ipnBF8jTvwxr5oV7fdQSojYKYPS4g
	 zy0iBMrWJoct9SyEoqAXiyexib1wQjHKq8ys2vKLxabqKJxEGKcpg/SahgKuGCpLd/Lv2
	 Dvczhhm1YbGHkoe0OxKkiUhOaxbmScYIqdzsvUuStGkEjyp7XT7zrmevxByiTRHeYTKLG
	 H+yj9hy13tttwgXcKRiqcIBRypcwu553Vhy6xI+8sSP1vcrwc9s2njphAyZJsvuNb/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+sZ2SGBKL+wA+F9N/uPCteUC32WVd5RJNFGupXt8+xA=;
	b=Y4RPlJ/eQwGnFH4YZVhERvqwJ6yZO6bILTUzsj66zPjNOUWs4/dOxcalJKtnnFoVOwpH
	 TPA9WC6U4HQEQXO1Xd7C57l/oiSWVaNkZJTCYWYRO61nQRJSoBw2m9vXFwx2DcZA9ymUf
	 lJ59U7yOQKN7yJjI9bJ+30eR6+oO3OaUaWOr4CeIDSIpuLq0rayil+1SQFlYgsKiGToDF
	 UoRToweZney/qyi7o6I6x156uBSKv0e2eZfbq99jB2b9PJmcg8j98A+ECRwgmPB0WrMMm
	 zz2JJPZwgRWSxaku6q2VT01kVUowjZyk3j2O/t/KeV/kMPvD14sHjR7wJPkl6rVy07Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G374LnRY;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EFB606EEAB
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 14:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83EFB606EEAB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G374LnRY
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e946155442so37409945ad.3
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 06:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793716327; x=1794321127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+sZ2SGBKL+wA+F9N/uPCteUC32WVd5RJNFGupXt8+xA=;
        b=G374LnRYRE87zWe4QgbNOVNjB4B2zEt6OVgBzP9vXqSxdyQ38VEGqSfxGQcVB0wJGw
         l24EZaJhZ2GROWzwHLL6SB0xegHbvE1K9wRhFujr3esRAYV4iDzIBRvQCzIy/lROAb46
         /UJClnGHNu80uisZNEloGBg3Ge1eHiMwcwkjKiTEMI9ppaQeXefICEdStGTduIMBYwMm
         ZXEaFc5YHhX7U89ru9Ne5BToKNKSa8Gd3mdPR3wmLRahhDsNdWA/W3O5+oleX5bD9WW3
         hziTSDoydsqIyfE+imtJ7ehVhP4fj0gucKBxMWhfdX6KIUcyxEJcsABHdksLWHJZOVPu
         xanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716327; x=1794321127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+sZ2SGBKL+wA+F9N/uPCteUC32WVd5RJNFGupXt8+xA=;
        b=Nt488t3KhHYLo9IrRVgpI/D55Y6+J/2bbhFs51eFVXYNcNfcKOG5v8jdm/00voB7ic
         vGDdQkP1EF0fP1LaByiLebBdcf4igPU0pLIIyQhOW+X7sDB4/JaqUzMWKxdeNgw5AvGj
         tfK0/KuYjLfTpsfZA31+Y22bOzmrD0aeUMX5xhfIFjrC3WS29lH8vm/sBjBgdolaAp3z
         nNaKCqPJWIi4p0aA3+n6Hn1bYK82DB//j7ENNHNsSMg0rtw1P094AwFVHSyKGZLPNM/o
         8qRJS437ZeiFHmMRm270I/4CSbb0u3kTOwvtjPMIuNRCfV1eVivhDI2Et+teH2b77pCv
         vy9A==
X-Forwarded-Encrypted: i=1; AKwUvBwyJRPe6cu8CXXoU6/m8RZleMkiQ7wxDII7gE6CRq4NItO+wZbGRJJ9EWvxmwRldlHpHO9Puv2/4YP8@vger.kernel.org
X-Gm-Message-State: APuU4Z85jbmBte4uO7je2He+xrIcihnlsTL9INjV2joNY9i5j4LuxE9F
	iMBagt+cn2B4/z0oWBDd1XNYDNal+Tx9leT3Lpr+pMyW79ATCEdzI8HP
X-Gm-Gg: AYBFou32LOmh14BrNn1eb2zz71OhAnEs0nlYRAP5G1dMQ66PkHsEObdx4sMkk/zQAv1
	DJu7OUrP0gPUFdg2Etu66hK73tS9MBeymRzBr2q+NirlgBsrAWxGeSQ4orAGOkupyhTiK/w3orT
	hbHVwzPVWPldtxB4ExgTMqbDiCLfRq0bf7Ykkebv/WEA2vteTWiuAaGIdwqYQ7BKJoe8Fkd1TI6
	Oi2NcOFCuxto9RiwLpxgCbKgorVWOYiod9UUoAKGm2G3D5m7OCAidKcYMhid4DySXjUddhMS9m/
	e2XFSXFdJIdM96C9/X/kSWdSrJQ0KqKbjj1xxYJTmaP6qmpiLBbRauratcDrBt2KX0xEMjh4JFb
	PZXxjY4fQm4XgwzCqypFbcpzdFDd/S0XimvFcjiO0oEkewT3vhEw5CGyccWhY3uQ9qrApzCj7vP
	cKod9QhLOJwSOSxIlhYWdvAWKvlJlRadXy9ovDlsLSDIbTIJoKOvqFhWLgFMHfQ0aSynpjRt426
	+hk8XvThI1Fvk85hjID2Mav1Ts+c2F90Rp7DvaJWCzLoXJB/DKKpY/MBUkq+aMT5H8XdchkTxG9
	MytYAVePSFzaKkeHOUXWe9RSPS1h2LQvB+nUy3odggzzTPAq/TsidodNX0/hY55mHpRofoZ1Xny
	zI9XY6cliq7wn8rkZxLNNw0m2ZLMZuUVIezJXHVMrVBI5Kwl/nfoc30bmWMDB8JQ7HZB+EQX6bo
	kvcpE=
X-Received: by 2002:a17:903:320a:b0:2e9:69b1:1b9b with SMTP id d9443c01a7336-2eb3641516amr136502015ad.8.1793716326715;
        Tue, 03 Nov 2026 06:32:06 -0800 (PST)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922fc14sm42816695ad.26.2026.11.03.06.31.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 06:32:06 -0800 (PST)
From: Yu Zhang <yuz08559@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Koichiro Den <koichiro.den@canonical.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 RESEND] gpio: sim: fix the configfs lockup racing with mkdir/rmdir
Date: Wed,  4 Nov 2026 00:31:36 +1000
Message-ID: <20261103143136.62155-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
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

