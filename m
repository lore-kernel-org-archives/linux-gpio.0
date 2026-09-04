Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07223486B9A
	for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2026 12:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525191; cv=none; b=h67FeVJ713LEBT5W6ltinns1aRN1you1LYELFHRaNvOkKooQ3xn3N2np61qEs244QpXsIl18NuXGT/7TBiYZktiODkzmUfYfKPUAyWOu5uh2u1lkimow4SDk6As6PUuFbH2m+WN75DLwCrUHOUKLXru0WADa2uBdYaMw2fOv/ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525191; c=relaxed/simple;
	bh=zSY3tsTOZBtA2hVUkZvtvXV28oUZaPFPy3Vkq+ARZNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q9E6hFgk8E9CRnVZ6irQpBmqOfeIBlWGWyTAZpbTnoL8Su9s2bJdQosprWYskR1p00ZYJMkzqcyVaBgz5tWrrmKDQt/ceGl0/JGK8Hgef8/6gbE4gpHmXmHy+oLkQRx3a+R0AOFQ9JKACKCn2qceoENDtypNeXU8isG3NeY8dqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kl0CzDLZ; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kl0CzDLZ"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6b1afdf5196so387020eaf.2
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 05:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525188; x=1789129988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFTOTrjj7XSWJTGyJNIYb5D6sM8s37aw4r9HKigmpj8=;
        b=kl0CzDLZ9eJeraix6CTaUU5m7OS0iHxOk3b0/hGHg38wqCxtfHrM2GTnT+sF/NFyQn
         ZHf4gZuC2I3sBDfGPG6+w7jSrWcNO+gtnrBzhT9GQcF3Ansr9wJtel0gIrHrSfQ9w6Zc
         0WrIN/BK3IlrrTS+3OpSh7GGH7XdxexT2a6YWuUq1Q/ZN3qlT9JqvF9ztdhg4zSbMMpZ
         sxF0pw5oeYpRMAZF6L49ZzToLq6QAYQmEo2/LSIFOWSK70DTEuO6hMn1whhuSUVvvYtM
         RrBSZYxEeLxJZbeoY1YNul39PtpPY2zjJzIrS3N8EtENvQTKsqxwEZswF87kYRe6RShR
         4r1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525188; x=1789129988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eFTOTrjj7XSWJTGyJNIYb5D6sM8s37aw4r9HKigmpj8=;
        b=WabpysBc7SJsP8CHmNLIK+qoMHilU5amPUgcCAIcMJCqU4Yi8EB0tMOpYIMSj6bDJh
         24QAnXC8iS+/j4/LVejXF9VQLyhj1yA4a5ZccSxXM5Ygqlnp/UsKyjRpcLX6hyOT+kP7
         pqGzx0bLF51/AOHHaFQz9Mt9Jlyz6NoArbAczTel4/UoeNmhzWBPrKA8mxchFoZjOipJ
         LKXBrt3XEyEPVquqolvG2puEVxFJJeIU/L6G60769pgRSgQXEtpf2rX7VTdH0bifDDSd
         KqeldmmZkPPeaRe2BJDwKc/cYUZI2PCnHdvXPjbmV1IXE2GX+A+5l7NxiFz6ylYl8q7r
         AlWg==
X-Forwarded-Encrypted: i=1; AKwUvBxeUGgWWFrgxsE/RBXx/DWg05N+oucdTvusbfot/epg5ovdfd+amsHaatkGYx14/AIr0UpNHlm5gE4U@vger.kernel.org
X-Gm-Message-State: AFuF++mCgzCdeElzmFQifT0LHSt4AfR0qd+7VHFzOuBGhIv2Ijnyiq3b
	GwRGy4dN3Emt1MD9vL6TK3SjXABJavAci7Hlu3UQdTZOF5iOPat/uTXK
X-Gm-Gg: AYBFou0lSIkMYRVjHEnSpvdN3+nr2y9+cLQtTGg+9cSMaJ0EX4TWHVe4HbLCJhVRzed
	Tohwwurvblkda6y/+0T/kJCtqhz+HOnRcA7SPwjG7F+8/9f3GcRw6Z4Y8OSODoZnQLNoEI26IFp
	b8QDZdy0XuAXrCKvIFbRavRzD3I1WS+x/EbvDdSzbYDzOte+zzYzQwDzTL3mKSrBpSP9XQN5/Il
	KVoOZX4rMm2QFnyzG35r3MnRR+dc7ewBb+6oHgFcfTKmuK6az6G3AOSrsfdaBy4Yz+ldtS3kMlu
	snX3icxMr/ZvzxNOCImTGnzWHQgn60Nkd6pO9S4yWOHdeIIMBSBLPqh/UQDINkET1gR1jMc+xfk
	oAJdHhrbdXIHOlXLxu8HPCftrsYggbCB7hjcO3VlC3Za1NErSa73Vo4rSPVwgfLGjytre8Hqyci
	4qaY+DgJ41+nTSsz6cxOTOj6G8/Xek2YAX+ayjfyezwxSvtXVFnhYiFlAkUqwyOUUOtYDBCBefH
	lrPxqF4UDqxwJKA/5RcqgP1ag==
X-Received: by 2002:a05:6820:151f:b0:6b3:bb82:2736 with SMTP id 006d021491bc7-6b6fcac57fbmr4027560eaf.17.1788525187615;
        Fri, 04 Sep 2026 05:33:07 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm6343458eec.27.2026.09.04.05.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:33:07 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] pinctrl: fix typos in comments
Date: Fri,  4 Sep 2026 18:02:56 +0530
Message-ID: <20260904123300.36778-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904123300.36778-1-hemanth.selam@gmail.com>
References: <20260904123300.36778-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/pinctrl/core.c       | 4 ++--
 drivers/pinctrl/pinconf.c    | 2 +-
 drivers/pinctrl/pinctrl-st.c | 2 +-
 drivers/pinctrl/pinmux.c     | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 1675dd36bd5c..ba6c71e6fc2c 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -147,7 +147,7 @@ int pin_get_from_name(struct pinctrl_dev *pctldev, const char *name)
 {
 	unsigned int i, pin;
 
-	/* The pin number can be retrived from the pin controller descriptor */
+	/* The pin number can be retrieved from the pin controller descriptor */
 	for (i = 0; i < pctldev->desc->npins; i++) {
 		struct pin_desc *desc;
 
@@ -1747,7 +1747,7 @@ static int pinctrl_pins_show(struct seq_file *s, void *what)
 
 	mutex_lock(&pctldev->mutex);
 
-	/* The pin number can be retrived from the pin controller descriptor */
+	/* The pin number can be retrieved from the pin controller descriptor */
 	for (i = 0; i < pctldev->desc->npins; i++) {
 		struct pin_desc *desc;
 
diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index 81686844dfa5..ecc888b029d7 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -311,7 +311,7 @@ static int pinconf_pins_show(struct seq_file *s, void *what)
 
 	mutex_lock(&pctldev->mutex);
 
-	/* The pin number can be retrived from the pin controller descriptor */
+	/* The pin number can be retrieved from the pin controller descriptor */
 	for (i = 0; i < pctldev->desc->npins; i++) {
 		struct pin_desc *desc;
 
diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index 8ce88e591f47..59ecc295fb8e 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -1148,7 +1148,7 @@ static void st_parse_syscfgs(struct st_pinctrl *info, int bank,
 	pc->pu = st_pc_get_value(dev, regmap, bank/4, data->pu, lsb, msb);
 	pc->od = st_pc_get_value(dev, regmap, bank/4, data->od, lsb, msb);
 
-	/* retime avaiable for all pins by default */
+	/* retime available for all pins by default */
 	pc->rt_pin_mask = 0xff;
 	of_property_read_u32(np, "st,retime-pin-mask", &pc->rt_pin_mask);
 	st_pctl_dt_setup_retime(info, bank, pc);
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index c705bc182266..574fc95b6712 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -636,7 +636,7 @@ static int pinmux_pins_show(struct seq_file *s, void *what)
 
 	mutex_lock(&pctldev->mutex);
 
-	/* The pin number can be retrived from the pin controller descriptor */
+	/* The pin number can be retrieved from the pin controller descriptor */
 	for (i = 0; i < pctldev->desc->npins; i++) {
 		struct pin_desc *desc;
 		bool is_hog = false;
-- 
2.48.1

