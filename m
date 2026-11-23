Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433596;
	b=0vyTZFOkQ9WjbIHSUCD/WI1TFkfciLS8tlHfO3vpLmr3gvGb306h/sXgveGlDonyjcyc
	 g5ZV2dSD+7OzaJx9uaSSCWb0mE0Bplxtjy7+B1wxmLXVDzHMGRoP83EIHEAZHRcRTUhL9
	 y06FijOmikFyzVZvfu34D4G6l+HbKdn5l0BXVHdU4eN4CZmt1rwvgXe6mGOVziph5BNYp
	 I4qKqP42HCu7HRSJJ8T7o8PQ2e7qhJMMc9DryCpWP+QwAdDnEHk5bb8RRDA6s9cuVZQR+
	 Ui/INR0GYJ0z/WeFnU6162GwURWuTCPm9TZ3A660CH7DGQ9BJ1QyKfI6+tAL+k8DR/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=h8PfSz1Z0HS7aEXYWIN1VEHp2/SQ6XDyiMLgGvjktH0=;
	b=ncfF11Xv1NYZSP4PZfQSCgchoc4GaMkHu/bioVqDqe8uBvjE11HrpigkK2aJNFO0xec3
	 QlRU73ZZbM7XHRwX16JRl2BRfO72Y+zZMvDfH7sCA0FhKGOjo8awp0SNgx7Qt4/BAjkdM
	 bln7dUt5yjXBO0Vg1+Se/kL9bF7mvYkaZdDK4lO2XmNxFxqR1b5hJp5bGMcLRXw8YtDvN
	 zd28lCTFFnjgskAlM8VwLJHwteeIMFGhx0gc+bJcNHqhkTQ9DQM938eFeN0yj+AZ8p3mh
	 XvrY2iIb43x1Ap3nnigEa2H8EH+u1+72teVZiLiy0WzuuMRFbxWayfBjVPO9UvMHLVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NUM4egdS;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4F7606A31A
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 11:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A4F7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NUM4egdS
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so427087966b.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 03:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795433594; x=1796038394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h8PfSz1Z0HS7aEXYWIN1VEHp2/SQ6XDyiMLgGvjktH0=;
        b=NUM4egdSLzip5f7WzayPpgs0/jIlwEePbGxRhIdXnVuVWMrWMtWCpjuWrXaYjB/DIb
         AHJ9gZHj5bABasHgvU4BC4s1sOgakUGgshPs2Y/httysdk29+jbXdhku/zMC3hYPqsbh
         n4sXsG6ZV6Lcf9LCtgstJhZ9dOfoT4L+eSktTfar2o5QP1IDcp6l5FrOKFJVUnC2toCd
         EjvxqGhSOqQUIEAoGQVV63YwkKxQH/X2LhjziyqWs1O/5PIfbsn775NQQc3uOLu+J/3A
         fKC25UcT3TkuvQZbLuCIKyDQU4Z+pt+IRS+ozZzjXPOS2wBnlGJrASt1UBhsvrJIf9W8
         T/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433594; x=1796038394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h8PfSz1Z0HS7aEXYWIN1VEHp2/SQ6XDyiMLgGvjktH0=;
        b=mh0eAp2NM+QtVbjRUAuZIHq9zorFEC82z6oNPv1CCB+CpR5Nr9vOnsOdnqrW+Lg0AE
         A6quDeRj08WJuG1q6iWuFyW73DrecaJH70p3wzepCHwv0sig74tMowJeNG2lwSf8xZhl
         K11bXg4myRH9iGG/Y0f2Set8XQehqfMLVU/MTF14JgPYn5GbEAhP+LBjHkzWU9qebs/w
         3hnFEo+O+XCP0AslbBtibuyFvqE3pmt37y9473ByLjOuwvChnOtOfr6QP9e5WkVaktZp
         A6qLI+uICHVIpAo23zE0dp5Tjv1NJR76DHrVc4MlouoDmtdnx4zaQaI6/53qOnv+i1+e
         CiCA==
X-Gm-Message-State: APuU4Z8iBWgQc/oBfSDp4Kzs1TZhe0KAECSFpkeWmI9Ojs1YKiI6TbWd
	0BrPZSwcuFcPW/4siDXMcnvzIXezI+rFGBD3Ui1Tp1jLdw4qnyuwgmOJQRpsg+5Y5HU=
X-Gm-Gg: AZFdTZew1g5T6Q5R/vUoejdDsJb06D/E1xDjlRGgIlEpkQcMskPLHSxAy6z2m60qMJU
	+pX3CypvF4QUhwbbzTC8JseY/KIhFHDj6HY2/7OpqSjKyyhGMqg6BtnNtEkqzofw8MA7Y6duXqp
	YYp0EG927NvuY8YHCHRt+PCwN+sd0Qy9WrxR+bDGU1AdBNz/rJP7GYuG2cDXWgHYgpfv1LE5bZP
	ex3I1uPDUUI8Y/VWTB4/23c4O92uVJMu1N9xy76wT7oq4LAxfSHrWInJkpGx3Gpqz5Z9ApS4oic
	9+YA6tPUzndT3Y2UP/0qkCQw2iSrTXghJ9z6BNo2X3AKpBZIX6oLtPC1GyYw+I37s+TjlRL4AOe
	xiT4gSRh1KeB6N7/FLR3LGv/yypcXXu3hqiFG+6US2DSyHOjPAy/RUvPcCHPSPpS3dhZtFmFAJn
	cHDZzvoxNDRmLRG8QcUKdF0yEpPAR6xBg/rOCtScYJ+f+mhKg557JYVrtt15jan2qWwsfQpxxwf
	HHLMSiD8LysuiT1rUAgbkm92P++mDqhieutyhlxyasCy7WfeEGikO7Ddr9RGEM1s4q5ksZ4VvtA
	MOJxXJomIfMl7cG1vf05TwBrfdyCsMGBb4klB1bGNqctwbaVfg==
X-Received: by 2002:a17:907:1c9d:b0:c37:8c7c:a840 with SMTP id a640c23a62f3a-c513a80fcb0mr952035266b.18.1795433593843;
        Mon, 23 Nov 2026 03:33:13 -0800 (PST)
Received: from lin-mg ([178.226.61.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afca58asm382625566b.65.2026.11.23.03.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:33:13 -0800 (PST)
From: Maria Garcia <mariagarcia7293@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Guy Morand <guy.morand@bytesatwork.ch>,
	=?UTF-8?q?Theo=20L=C3=A9brun?= <theo.lebrun@bootlin.com>,
	Maria Garcia <mariagarcia7293@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] gpio: pca953x: Fix TCA6418 multi-bank I/O, caching, and IRQs
Date: Mon, 23 Nov 2026 12:32:32 +0100
Message-ID: <20261123113234.197852-1-mariagarcia7293@gmail.com>
X-Mailer: git-send-email 2.52.0
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

This series fixes multi-bank register access, input register caching, and
interrupt handling for the TI TCA6418E GPIO expander in gpio-pca953x:

  1. Disable REG_ADDR_AI (0x80) for TCA6418_TYPE so multi-byte reads and
     writes advance sequentially across all three banks, reverse Bank 0
     bit order (bitrev8) in bulk read/write paths to match the datasheet's
     MSB-first layout, and mark the input status registers (0x14..0x16) as
     volatile so reads do not return stale cached values.

  2. Support TCA6418 interrupt setup, edge configuration (GPIO_INT_LVL),
     masking (GPIO_INT_EN), status decoding (GPIO_INT_STAT), and W1C
     acknowledgment (INT_STAT) by reusing the existing pca953x paths, 
     while rejecting unsupported IRQ_TYPE_EDGE_BOTH triggers.

Tested on TI TCA6418E hardware across all three banks (single-pin and
multi-pin reads/writes, input volatility, interrupts). Also, independently 
tested by Guy Morand on his hardware.

Maria Garcia (2):
  gpio: pca953x: Fix TCA6418 bulk transfers and input caching
  gpio: pca953x: Fix TCA6418 interrupt handling

 drivers/gpio/gpio-pca953x.c | 120 ++++++++++++++++++++++++++++++------
 1 file changed, 101 insertions(+), 19 deletions(-)

-- 
2.52.0

