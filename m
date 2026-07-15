Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753E52F39B5
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 07:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784102012; cv=none; b=SjqqA2Ih/95rJppOZA/P3rpcFjK6r4p6WeGK1OvZN2dOfaIj81jZnOJtW6/lgLmRPLUBIi1DF6EzndQ26f6ZMnXGZXQcWwE3stNlpCJL/tL0T6jyNaa6DVv3WCnDg81s5hYYdjPLJMSJzlN/g4OhnbIreWc0YcS3YiNufWjxUuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784102012; c=relaxed/simple;
	bh=D+xf8RfBWEGBNWwemwwvR7tBGeYaj/f0s31npwznyRA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r93CcNqcHsVYjqKlAC6djRBuTVfiymafzz6ciRrpElfMBrdY1bbm/SD8mHO5pThKkrgbmaryMvKrNt8/KX+dW6yA1J4JJjBfwcZEHchCIB55uBt3KI61sXEpzxHGgY+WRnUE/fXRSA/CX19XQjVgTkLMmM4ubEbx8NtbjLXFUU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in; spf=pass smtp.mailfrom=cse.iitm.ac.in; dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b=imelOW7/; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b="imelOW7/"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ceab75934dso45829905ad.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 00:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20251104.gappssmtp.com; s=20251104; t=1784102008; x=1784706808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LjMpsWc2aaUxCad0LHR+quphAVljZgAmTIIlhxzZwXU=;
        b=imelOW7/60OJoHiWghOQHBKkK0GICW3Lq0m2vwhBSBX57hn+NsGMLujKNz2s/6BpyW
         lmpD3HcpE5hMT8WdZwiaeh4OXuvYPzYslEcuc7HhTm9aGp13SCPYDl3CAFol2ma2eImW
         vO0vi2Hb53Wya0S8511lHbK3YnZdAh1+dKqiaK3zHgE2hi0fzw6ft8oyPEAC7ULoy7o9
         K5uREBhCBp9ZwZa5/7/9o/8dYxP7uB4cSf33S6/IJiC4T20ckXhTm8orBvg/KtUNl+7W
         sSUcq1p7gqY+JwIL2fv+yVM0eaEM0B0ObLEA/7ru4uWauR5nNDDxjMfYegpGc9u6fucU
         hhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784102008; x=1784706808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LjMpsWc2aaUxCad0LHR+quphAVljZgAmTIIlhxzZwXU=;
        b=rRnu8BrYO/ARwAAEaML+7Qr1a8ujcDD5C58by378MZokiPBjQ0QUigdqe8NHqyrtBP
         srPbJ0AeQoqwBdCCd6TQS1QVizNeDB3bj4txJvmmd8u2E6hp748EssE4YJ9bxC1L0fTj
         C3GXQG6aaWW7M8hbU4S/iwOMhKEgsmeQpmEAY/yaWQGLN/pkD3aojRfM9MlM6UzO+4Kr
         COvdxXnBAF2hGES7OUYFF+5IAYJ/dyDPpaSiUJ3JKtdV7ezC/ITDrMQk/+CpB+nPOM3L
         s4OS5i1ucfV3yIgf4TnHSNWF7Ahr7KaGxjDG4YcPhWcXhMawb57wq4v6pV//pjP9PKMM
         dFTQ==
X-Forwarded-Encrypted: i=1; AHgh+RonfLbAkEtAmHYkR8bEDFT7+goyckhqnKkEbyUpiIvdA2C+QdHVJtEGYhV6FJ0oxx8d1FJEpTtVWzMu@vger.kernel.org
X-Gm-Message-State: AOJu0YxYYH5M2OMwjGiAFJegltxKlmtP/4BzXHaoYu2otg3LUCBL2ALJ
	KjCK+BcLuWI/57V1GKfGk58ET4sBHFGpEKP+QtEW2EiG0vQDZFydSWIeNU3phlItQ7E=
X-Gm-Gg: AfdE7cnaz815KyBJuaJoOtikSgPfjAfPnhtYFMMgLho+0LedmJRf3UQQ9bJhMkXlkfj
	9QjWMlAXwOTkNDtlKrZxzMtTn4O4OH1+1TPvVreHPv6AVkcnRNeD4EUGTLamJmGQ4FyUgHAFXVP
	QXyMeqyE9+pZvmrIEqcN9viOzF/yQGm6CMxa/RjTwER06i19Th29k4WfYnmSeNWXxFJG/rf0GKv
	JKeSPSb9u11NFhMBeEBofS0ht6s4YkIm3KtoXptmXY6LOg5pILlTTBlNxRbZHo4Zvkcelo0JxUu
	JXDpOw2e67++WkpUdq4VRkvQjcgqo2E1noWsRZAQntqXObURrgKxVoLV3k4KCy+YYh8nPW8uXGN
	h+LVjy8q2FG4kOvKI7lEdpmgOl72pvA9tZRRfvMdKVUEdcSl7GlAuD++ftksL1dBU/DsVTmBK+O
	LoN54Kuujnuji6IiPXOVzcgEsHLdjImZw+zTz47JrRmQ+kXM3/jdvi4bwyZ7AgoKgHxXz9oZJuM
	jSPx/2siagClloFFnnz+mlu7scN/kRUbGZmKJNAIzM=
X-Received: by 2002:a05:6a21:6817:b0:398:7df5:2dae with SMTP id adf61e73a8af0-3c36c0f869amr2017583637.9.1784102008606;
        Wed, 15 Jul 2026 00:53:28 -0700 (PDT)
Received: from Metius.iitm.ac.in ([103.158.43.43])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-3118389d9bcsm75967633eec.20.2026.07.15.00.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 00:53:28 -0700 (PDT)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: wsa+renesas@sang-engineering.com
Cc: Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	linusw@kernel.org,
	brgl@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] gpio: sloppy-logic-analyzer: Fix memory leak in gpio_la_poll_probe()
Date: Wed, 15 Jul 2026 13:23:08 +0530
Message-ID: <20260715075311.527753-1-nihaal@cse.iitm.ac.in>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The memory allocated for priv->blob.data is not freed in the error paths
that follow the fops_buf_size_set() call in gpio_la_poll_probe(), as
well as in the remove function. Fix that by using device managed action
to free the memory on remove.

Fixes: 7828b7bbbf20 ("gpio: add sloppy logic analyzer using polling")
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---
Compile tested only. Issue found using static analysis.

v1->v2:
- Remove the return code check of fops_buf_size_set() to avoid
  confusion, since if that function fails, there is no memory leak.

Link to v1: https://lore.kernel.org/linux-gpio/20260710064838.153528-1-nihaal@cse.iitm.ac.in/

 drivers/gpio/gpio-sloppy-logic-analyzer.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpio/gpio-sloppy-logic-analyzer.c b/drivers/gpio/gpio-sloppy-logic-analyzer.c
index 2bbd308ca08e..aa23b5779802 100644
--- a/drivers/gpio/gpio-sloppy-logic-analyzer.c
+++ b/drivers/gpio/gpio-sloppy-logic-analyzer.c
@@ -160,6 +160,13 @@ static int fops_buf_size_get(void *data, u64 *val)
 	return 0;
 }
 
+static void fops_buf_release(void *data)
+{
+	struct gpio_la_poll_priv *priv = data;
+
+	vfree(priv->blob.data);
+}
+
 static int fops_buf_size_set(void *data, u64 val)
 {
 	struct gpio_la_poll_priv *priv = data;
@@ -238,6 +245,9 @@ static int gpio_la_poll_probe(struct platform_device *pdev)
 		return ret;
 
 	fops_buf_size_set(priv, GPIO_LA_DEFAULT_BUF_SIZE);
+	ret = devm_add_action_or_reset(dev, fops_buf_release, priv);
+	if (ret)
+		return ret;
 
 	priv->descs = devm_gpiod_get_array(dev, "probe", GPIOD_IN);
 	if (IS_ERR(priv->descs))
-- 
2.43.0

