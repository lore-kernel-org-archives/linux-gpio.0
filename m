Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009E4390CA9
	for <linux-gpio@vger.kernel.org>; Sat, 22 Aug 2026 21:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787434850; cv=none; b=fVZJ3crxZhxrQgt++wVV85pHMlKh741Xz9CYvEd6elTsEmt9XR8/IIWEShhkXrxzD9tH9I40j91xil4dryWVxvJzIF5da13HNRi613ZbLMjNDLHhiDlFrrHomVgyyEz88teI+QCH1bB9J1fQoZDS3/fy1e+AvhfLcKAILSDevFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787434850; c=relaxed/simple;
	bh=tSaYsW5ZA87m0Wg9YJ+wfmB/gHIRTOyA3syuwyg8qeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FJjrK/LH5Ekb4Bc3M8iSwyyPPV8XIhH5JLVvDdZCV4bWjXlISi0PAwEQ3fwJFc9rQIZRYVMrwp1xlhN/uCE98YuyQJcXi27Lg+g/Xy/vvO3F5k/vNjeW1YYsfTJxAgi9RICxLLO6AvfZ2amKzzchpmJ5AotBewV1Ob+S1xkNV0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oTQtPDkb; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oTQtPDkb"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2020421077so372283866b.3
        for <linux-gpio@vger.kernel.org>; Sat, 22 Aug 2026 14:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787434837; x=1788039637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a4eLlaKD/QchVb0r7zAM59fvM/PJvb2qK03bPG46mJc=;
        b=oTQtPDkblPAwvUkJILdH3vavLZI6Uk5u13K9Ty3z0sAfJwsMNIn5HHspUOj/MbClK9
         i/gC5WT6TRpLrB/v+f4+FSlpMYBxviJFaHQBbWx5OZe/3PxaCQfXjb8ODwmWqN0syodk
         PLGE5SeHFYlu1aei1esnpmpkwSibc2rwC6ldYusk8RW4WdhxJvRfAmp1/LRo6rbdBiAQ
         U7J3Cq5XVpdfa9sC1fGgaRtqjhxRUWHLMFolk6SUDVl1QLN14Dyi/obQGb+72Ajt7+Mo
         uIY4ZI1I6AGcHImG499TdlfkMy6BnBy8w09JaqLNU2wB+P0wn7t2KRWHAnl2WG75vGbN
         b24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787434837; x=1788039637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a4eLlaKD/QchVb0r7zAM59fvM/PJvb2qK03bPG46mJc=;
        b=L1uDliLXrmRPamKTvUZ5+AFLNINQ6lk2gz8bXfTsVKQCHr0gHePK6GZTnTDn/ODDar
         jhR99dOumcGP/CFpigtiNrJ4W6ylWzPNhAiYr0l34NlT62AI8Fxc5OqYV8TUGNiWvsxj
         b+YLzbgn1Lp6Xoi5nrk+NAeXEPkEkoyMxEbseYJuYKO5EyhQv16nLbUvy7lJp2Xvzynj
         RT8atlcsGmwNZWgtfTytcVPri6idEUsA720fYAPk0pcB6G7/cYWl6N9U0cQ6+IMpLl9h
         EVtBRdKJyQvknfgPJZHTj+tGyRRLgSW+KXpX66aJsH7BjdsjbiFdRr4WAYNnU2IXyXdd
         LUOw==
X-Forwarded-Encrypted: i=1; AHgh+RqGGoyuLt5swNTrswoWK8B7PAdNZXDd3h2yhgFrw8KHL6Q4p1WjrZS32kvlgETMGUdALKildMuxy9YS@vger.kernel.org
X-Gm-Message-State: AFuF++krULMFtgeWCeQVAoo9KfWKa3aT1OlWGyIQPh4z0MY3/6i74I83
	U+3e/mczVVNDAOgtb44TDboS1aol/OOFH2oXtZUOELIondarq91+shJT
X-Gm-Gg: AR+sD10UWabFwoKR1O8jGFkxqGT0jFpe2w0IEoSujhLetAERZaSUh08Cenf/O/wNfQk
	5DbL1xmMHWlpZq00cuvK+ZDpVA69WMABo2zH8H+lCadC1QsPjNev1SKbP0ec7k4refkP4BhhUjr
	LTxdezcMsBW+qWdv/72O8OVelWi8z9eQyVP6yDYrYOo5URRNSp7Hh2GU7rCi03FvQNjIoisUDBl
	Hbm/qFF52MlaBC8nAlQtPh1bQVR9NHq5bXFy45ar28ffGvvTzlmIFh8qeryJOpNTrsv9RcXOBjL
	9wkUQmPNstTgObNpjVZrEgJVyKOxWOdMrrvEgeFud0E/YWcIFsoZ+Lacpwp7X1h1Z4R5LVyTbR/
	QVZwEkarC+vszD1cE6ysA7La9Hmn4AezVUgJuIEnUwkvCt35f1VARkD94/cebK/3LIUg5svh5KC
	CfNyJ/N/rOShqBE4+Y3xQGbEiUSBPmuz66JpnUcHmMCsHrSoX9b0o4Dk0DZO6F0X4QsfzBAQ==
X-Received: by 2002:a17:907:1c27:b0:c21:382e:9a38 with SMTP id a640c23a62f3a-c2491c2a110mr884931266b.2.1787434836795;
        Sat, 22 Aug 2026 14:40:36 -0700 (PDT)
Received: from m2.. ([37.142.151.124])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c24966f99basm466778466b.37.2026.08.22.14.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 14:40:36 -0700 (PDT)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Germain Hebert <germain.hebert@ca.abb.com>,
	Rio Liu <rio@r26.me>,
	Bruno Giacomazzi <brunoceg1@gmail.com>,
	Christina Quast <contact@christina-quast.de>,
	linux-input@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH 05/13] HID: ft260: i2c: silence sysfs store big-numbers
Date: Sun, 23 Aug 2026 00:39:33 +0300
Message-ID: <20260822213941.98882-6-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260822213941.98882-1-michael.zaidman@gmail.com>
References: <20260822213941.98882-1-michael.zaidman@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FT260_ATTR_STORE returned the feature-report transfer length from
ft260_hid_feature_report_set() instead of the sysfs write size. For
values like 1000, userspace writes more bytes than the HID report
length, so the VFS retries the remainder and reports "Invalid argument"
even though the attribute was applied correctly:

  $ echo 1000 > .../clock
  bash: line 1: echo: write error: Invalid argument
  $ cat .../clock
  1000

Return count after a successful parse so the full write is consumed.

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 4435a39fce23..8db896f164cd 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -1479,6 +1479,7 @@ static void ft260_attr_dummy_func(struct hid_device *hdev, u8 req, u16 value)
 				hid_err(hdev, "%s: failed!\n", __func__);      \
 			else						       \
 				func(hdev, req, name);			       \
+			ret = count;					       \
 			mutex_unlock(&dev->lock);			       \
 		} else {						       \
 			ret = -EINVAL;					       \
-- 
2.43.0

