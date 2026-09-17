Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AB63D890F
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 18:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789668249; cv=none; b=O+tahyTrWk5i1RX3vqDeE59SAxnr2xM8TEZ+XcJWeUNSC14b4x9IP/10xmuQBnQvw+OAA3hlhXGaz83JnxE0wU5zz7wvjDmAGXlO3U27USNEvH4uksCA/OGo0f45H/eLok1FbK8kDX3ajgFQQbTFyTtFvRJPu586QQJcxDG7MAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789668249; c=relaxed/simple;
	bh=5jk7arBCrVb9gyiNByAj8Ixk+2+PmKJPbPReCUIsRVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=REnA8ARzGXrOLKetH3e4To36bUIz0Q7VqbnjeATFQ1eLE6kiZTqCw/s/bdMwvkjMAeOOzQaXghedudVWB0m7+hxRAIoBY/+pTOrpUsTcBgzUAtqA06fbmkzZh5bg8yw60EwXlhm4E78pKkqkLmVUuUvkmfwbayHoLzqPxRSGNUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjeeclU5; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjeeclU5"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed1368so13639065ad.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 11:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789668248; x=1790273048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WTaXNCz+u/KtBO7bBU1VDH/lYm/1KJNlXPOVs0ymj2g=;
        b=LjeeclU5UDnkO4dvHqIeMhoRgL0/bfOSN6n0nmOokLvsrkO0QiETOzRP8wsfYd/ukb
         dfXKDHFOnsFyZmzu/CtNLSt0hXi0A1/9lXVSgA7u2UVyDs30HZ4Ih7ZJH01YHrAwefu5
         J+xzRSpyHkrIqeZwc5Gm1yq7oOdKQxFWEWRCiVR5y/xs9HhvakOIuh4mtYt2POWDOn5V
         YzMbVP2jmkYHHfeoR0EY9hwz9BV6qIQVLC82NQZd2wu0UdT0ym2JPdvqpvNbbDZ2ph7c
         4DiaMBlXNxZxmyJND/iOJpYtWrVE+qZs3U4ipllQiDQQh3Dr21LSMyXOAQQ97meAF/w/
         uVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789668248; x=1790273048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WTaXNCz+u/KtBO7bBU1VDH/lYm/1KJNlXPOVs0ymj2g=;
        b=RGYcDRxnhmbKyjYwXLu7Pic0lIOACh8ov7liPxMdS2eXUQ91+SZ0coDZpDlsGyUbBb
         ZZgMNTAcs0RtDC5Q3uVGzPP3ocmzH1LsEvP0kULIi6a0u14Gt7tlEcSAmuhY4KWNG7+N
         oK3LX0ZDOmFaaTmxYev5Sd8a85W+r4DJPiYaX2eGGmq20jUkzWCAKefap66ZRbA5K/GP
         C9arHDlIGY919ic3x9SioDih8FUmNBHEJ8RSBZb2B6O4Y/rqVREAAarldcgLHW3ElhqR
         Cerh30DmfDNYVPWNo2fzSiIJun7iZjIqjEAATj9jD7MXWkimO1H2HrV7SPCc+2SjKKDK
         7SmA==
X-Forwarded-Encrypted: i=1; AKwUvBy/26x0B/Cac9Lm9TwiUqRC6K+stWQF0HY42qS86iz0QyUKbxnUYh5PYSw8VBOuFwZ54X+As9kkvXnf@vger.kernel.org
X-Gm-Message-State: AFuF++mM1wEfwmnEOhDP6Kbdpu2AP6XykCdUcJ7K8fDoXcZMwFLD1gBj
	ZVBgwt1rD9SOtb2DMi8g5C8FVidPTzwTddqk1E2ncudx6R2nVYPP1IlHLbG02lPAKYJSBxiv
X-Gm-Gg: AYBFou0PK77yrhZVTS8fVY9MQkqYWsOalk5+nxXpSmzLwpgq0r/j0rqbLBeEtKKqy9t
	9Hbj8r6/8llY/qOt9szZDCTBplDXp/g++IZ78UDPh4xRLoIz8nY+6bVUQJn2w27D45cfuvcWJxp
	5TQ1fYxF2vPVGdeQVmguLyFcQ9WPzqYh4b/6QjCZOZBmc7ykZtzw++05xGoIchwuCNa6ATWhEE4
	UIb4s76V7WKFSqHUpR/hH6DFAJnY+7TUpI0RHzjoGxBGqvnP81QzdWG16YGk97WlR6ludDFA9hs
	vqt8Z1V1UNm2igCfhwqLuTyW5e8JGpdg49XMD4aDISU90QYSXB/Czg62H+4VxOL1nJbKke26R2C
	Bh2ThWfPXtAbgFjhwdt5yhMmEftr7UHrzr271mG/HAOLJ4hH+02yGzv2exMI7OftHYZwkqK19uq
	Rkbz11jm7KTobeOsWwgXObTLJuKDd1YL/BF+cSwf3k6Z4m5eTZ6cNv8BO4l0Yjc5FJwWPw3Zd9Q
	0eoSbzOUsjDh2daM7Q25ghcxhbxmZOVw1qRtLP8/DuEJX9XGLOCnmgnIk0HMgzRcVqMSQ==
X-Received: by 2002:a17:902:fd83:b0:2dd:ad74:6d12 with SMTP id d9443c01a7336-2ddad748f03mr21198015ad.24.1789668247846;
        Thu, 17 Sep 2026 11:04:07 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:301c:f8cd:455:c3eb:633c:5d3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89eff35asm30446485ad.58.2026.09.17.11.04.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 11:04:06 -0700 (PDT)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH] pinctrl: gemini: fix kernel-doc warnings
Date: Thu, 17 Sep 2026 23:33:25 +0530
Message-ID: <20260917180339.49882-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct gemini_pmx documents a virtbase member that does not exist and
leaves pctl undocumented. struct gemini_pmx_func is missing num_groups.

Drop the stale entry and add the two missing ones. No functional change.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 drivers/pinctrl/pinctrl-gemini.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-gemini.c b/drivers/pinctrl/pinctrl-gemini.c
index e9f619278..a029cab22 100644
--- a/drivers/pinctrl/pinctrl-gemini.c
+++ b/drivers/pinctrl/pinctrl-gemini.c
@@ -41,7 +41,7 @@ struct gemini_pin_conf {
 /**
  * struct gemini_pmx - state holder for the gemini pin controller
  * @dev: a pointer back to containing device
- * @virtbase: the offset to the controller in virtual memory
+ * @pctl: the pin controller device
  * @map: regmap to access registers
  * @is_3512: whether the SoC/package is the 3512 variant
  * @is_3516: whether the SoC/package is the 3516 variant
@@ -2031,6 +2031,7 @@ static const struct pinctrl_ops gemini_pctrl_ops = {
  * struct gemini_pmx_func - describes Gemini pinmux functions
  * @name: the name of this specific function
  * @groups: corresponding pin groups
+ * @num_groups: the number of pin groups
  */
 struct gemini_pmx_func {
 	const char *name;
-- 
2.46.0

