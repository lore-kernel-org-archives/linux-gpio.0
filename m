Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585922F87B
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 00:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778114515; cv=none; b=CIXQgdLU1CoX9UdJ4PP5buQPA6GzSJtuRyi2dGsftFWXidYDXIL7sQWCuW5nNhLwDB60fz4HsoI7o/l9pjnwPtPSx+tfwBI8f1xVjzFIi6PzPnyHOxZCUWuO2Sd1RoRX/bm5EXLXrMex98Ldk0wv3CkUMZmFcBcTrLQ27fBheOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778114515; c=relaxed/simple;
	bh=SE6qI0Xl7qswPzN1wYO0K6neazhV8iSlXtF69PMSKp4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qAAPz5vrOjlDHaduVYPbQaZWBzun6EmUd/3gSRHRnrKxhHn/2YKPjVho5wT29pZ7O2F4ImjIzvA1UQFH2qRo7HNSVvpAaScBL9ijtRPTCQ7GiYRqDaRwvVinOkktTa2cXnlsN3H1vb96OXKRNZdGZViXwnsUv4PZ1+O2f/YddJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jyqBBnzz; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jyqBBnzz"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-83975e992e1so79558b3a.2
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 17:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778114513; x=1778719313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BE987k6Fe6R2JtnCpGKYS5lOUEtR34vfgtyl6STircg=;
        b=jyqBBnzznbGz5dFqVBT/bsL4HUk3cIHI2Eh9o4pBguMiyHDY6gNd8ISm6iEJXtDTb0
         KQdCLJellifytJnjBeZuLSJwEyC++JutTBT5SXUr3463nqKfmia9He7eHSvBEHDUhu1J
         NkWs65ehg+gr2xdCUT165XHnLahrxujsFKlGeSqUnxwMUNfOrIUcga+J3BResQ5VHAJ5
         93HYfvwN00B4IjZR8TN1nsOdMmakLe7X6Xyl5RbQ6DXhLJi2NlIMHe5M7PgSaMLEPFfj
         nIYYBXv/S68t//PEsUbxVftyUVbtLRt7p+zPWEGSjifnEg0aOWztohw7DQ2NSiQv8VdT
         IWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778114513; x=1778719313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BE987k6Fe6R2JtnCpGKYS5lOUEtR34vfgtyl6STircg=;
        b=nSLTOR8np5OFy/L1bGmZaqT1znZ9u8BMxOh8jfNkcaKmFAyPwu1awHe+bZU1C0u7f5
         RpRtL43FTZep5h9cunEJC2UtXBRk04KL0jvUm4OOsz202xdkbgZnHq1LJgQeCNNPoiTH
         dL2kPDfHS4eHbEc4ynnqctY7cVuzTQvtxHzT+5b/k5uIh7qdFO2XpGNxrsF2jd9iBenI
         2oXl571dcSXuWmw6QY9gq+lFktc4eLPCaAZOCAugoUx8BPqPy6t1cqX7kTTIcLLU8vWV
         bn0OYnelE35BgRqhV5enPoXkmsxDiQPDoVbsSfg9UZtLJx64amQ6WGky3HR8hRb2l/1P
         72jQ==
X-Gm-Message-State: AOJu0YwjE9Vw8ZB3noxjAMIuATfhG0tJRi5fV1lzJ9UM7XhT4ypWuRC7
	0egP/qVxZU07mDcgPZ20fNSKPFbEHnrg1w5l51DgJo6cOk4tzEM0aD2MeS4dpw==
X-Gm-Gg: AeBDievd83vb8vSc9Z0in9RV3BGvMKkQAXyZvmXOqXoI8lhs/Pdbri0ZYHCrDWFr+HC
	v1fbC1XE7kV0UMVAVyJYwrOfr159U5iQitGKkdVRouD+ET+UcZ/m2e1X6hLR2PZTIbbAfiDxG1K
	vWH0OkBakD/U7NS/OSHS0/b5ittZeRckkUuodVIxYFeadUByIJWWdTnCVaJZ0OB6qcPpFMd+Xa6
	x5/h7urgTC22Dah4ML5mTLh3t3bknfeixuyNa7aYfh+slhxb4q+R678AcmsgrwGXdBgIIO7w4qt
	cagRk+7W2ZSUAgi9VvxYsRxNQIJstDU5DGSh2vQTCMQYkr2n4XwTqQOW3PxtHTozhpexG4GlEUO
	YRNn07Pe4/OvOPDMmvHRAHqAXE1qRa4cw0ovrxYvViuMOqQatulAXfdUDsNlCUQiZNROvqle7ns
	5f/r3jU8//ZT/YaBSOPhR8MbT5i/Wp
X-Received: by 2002:a05:6a21:328e:b0:3a3:a5cd:560d with SMTP id adf61e73a8af0-3aa5a903f41mr5886644637.9.1778114513441;
        Wed, 06 May 2026 17:41:53 -0700 (PDT)
Received: from 007.. ([2402:f000:3:1001:8803:d9da:dac1:4a73])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c825378fd56sm349094a12.8.2026.05.06.17.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 17:41:53 -0700 (PDT)
From: Zhang Xiaolei <zxl434815272@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	warthog618@gmail.com,
	linux-kernel@vger.kernel.org,
	Zhang Xiaolei <zxl434815272@gmail.com>
Subject: [PATCH v3] tools: gpio: fix ioctl name in error message
Date: Thu,  7 May 2026 08:41:47 +0800
Message-Id: <20260507004147.28963-1-zxl434815272@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260504075036.12190-3-zxl434815272@gmail.com>
References: <20260504075036.12190-3-zxl434815272@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the correct ioctl name in the error message.

Signed-off-by: Zhang Xiaolei <zxl434815272@gmail.com>
---
 tools/gpio/gpio-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/gpio/gpio-utils.c b/tools/gpio/gpio-utils.c
index 930a38fe7911..0d52d58cc6b6 100644
--- a/tools/gpio/gpio-utils.c
+++ b/tools/gpio/gpio-utils.c
@@ -95,7 +95,7 @@ int gpiotools_request_line(const char *device_name, unsigned int *lines,
 	if (ret == -1) {
 		ret = -errno;
 		fprintf(stderr, "Failed to issue %s (%d), %s\n",
-			"GPIO_GET_LINE_IOCTL", ret, strerror(errno));
+			"GPIO_V2_GET_LINE_IOCTL", ret, strerror(errno));
 	}
 
 	if (close(fd) == -1)
-- 
2.34.1

