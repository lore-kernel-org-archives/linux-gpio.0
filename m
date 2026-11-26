Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697293;
	b=mg4s3Uq7DeZeIAGAEva25KNYQ8elxWWCYPMAQMBJ0PYdvEdaER4OIG2oJlbwolwYXNBW
	 Dl0+zyYJqThFXXOWJ3chrLjfTbRJJJiRpQsfIWMGZoD62TrUelIL/nvkeJnYd5yYDaiiI
	 TZySubZ/M8PzGwsxOqWN/CUT6Cx4tOskBtKQVM9Z+ATmVblZVUHf3nboFj6hBQXZ3eWBo
	 GZf3gyeIC2T+UP/S5jjkmyLhlWEgZLhNK5ql2zA90z4MVQZoU9aq8GNfH0ZJDwdneq/3l
	 4Enn7aWP4+CYae7fOsJaVSjFxASXAUZxDYj6LEIs904AJlpATo8GNp0FstYk/BCWDMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8UXmhjzmrSz9c7UGZC3PvW2Va1zzLFwfvXp87xtgrDI=;
	b=tHLROuhDjJX9m/OXCF8H6Vzxdqqm167FBeqWSDwxRO2C9JjkUyEQOSJQB+54shPkHFm1
	 rZdCuVh2dNYJmmqerjDlAXudNFZXCXBlRjXCkEaWZRhwYh3rc0BCJQKEZGqXzVouw2LMn
	 VP62jRyq2nmWj6zGcNxvLFAhxhDbQLJYRW+n7PPYBtG805tJTRe4APhcK7OxVB/2HkrGs
	 Ip0se4PEB0MmHu/4T6GV/hQMZSbFzvg+69mhn0H7v+c1icRmN218EO/mLOAtGzNqwPrdy
	 2ri9h/J/3a9iywzLm20PpXxiZLyk284cdThGnMFNm0IYW428s4Gyf1XPT8dwGVRXF8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NRd6IM2n;
	arc=none smtp.remote-ip=74.125.227.135
Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF18606A321
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 12:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFF18606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NRd6IM2n
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-3b4be95e0afso1880056a91.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 04:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795697292; x=1796302092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8UXmhjzmrSz9c7UGZC3PvW2Va1zzLFwfvXp87xtgrDI=;
        b=NRd6IM2nMKDbRQaG0Ara5j45MRa5HNcGGGOv9QmXi88i3V4kx9O1RUtaft1LqiJHKU
         oRzc7zM5wNS0f1gbek0tsZZu857dTzMgDfwsr9x99nsBtV5aZvZ2yZR3bM6mcy/S490z
         EgGm87JPBxho7Asm2iGgyZCcpq94GXlUnNbXcGqdXzxTj/VkouXfSbPdcPCTk6YkHvSy
         NDqDNMcI9GQfNqCl0PwwiD92MgpBkhlPav0oJbv3dVOf4WuW/NSctBO+YSYpD/TXqW72
         hk9qomN8IK5prBkHJWqNbdK9er0jKAMf4uJLmdJmFktcYM2qmVvPyy0yN92tw1PQFhP+
         BgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697292; x=1796302092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8UXmhjzmrSz9c7UGZC3PvW2Va1zzLFwfvXp87xtgrDI=;
        b=aqFsRLpA91B72P35YKujGKBQqi5Ul7aLWQxYBr7wLS5a8GUdwavXuFVQykExtKDh0V
         jnk7LOKratFVQY9rOnEXb3Q2mx8+kmDAoCJXZTrp+bMsyii9H5z0J41b2uBJPCz4zHSH
         3XZCJKlCm8Z8POoDmNXbqaNdO0HNfhn691nZnClu333D0QWfEb4UAR6w7zZb5Kq7FqrG
         oH5ONYjyRB8giNCymuxB5HuzV4aN1V/plhHMwekDLR5mmGIS+iSg0uMsre5GoId9ux5O
         TzT88UXpVxpKS/nJw+X5zQKJTL7nuF1flQPl4Jh1r4a0iBD70ywAV3aAN3O1o1Hnc2KQ
         /KwQ==
X-Gm-Message-State: APuU4Z/r3G5Lu5dv4kyeTLCn0J2Qk++zOjBzuv7kB6P9D4ooYj4M+cPz
	BUQDaPYa+IFQfNNkf4VGwCftvni1DSXxHYx72oyV68u8ITHzt8AuFLfv
X-Gm-Gg: AZFdTZfxQMOLCEHkRG/19kJBEKbv0PykOFy1cw8ddO3sRc8INhbGJNey6//0pEPkQqt
	h7DkscNyOKcJuZ7iBLLvi7wx7avuj7cvY8mcpo6zJOs5khtk9JcZtXFWLryQ5GKQjl1HkVlUFAw
	uGxP3EPoMQBRjQpuzAXme+K/qsrFmANjDq3jE0D0Z8CsoYenvKOZeDTHC241IIH8SQCrcmpLDsW
	1a9cx5acNyrc0q0ni94rvIiAZVmv6EwZWeiiW3jt6Cn6dm1mCfClha0TqfVI1M6FJ62L2a09858
	ZNABRp0zqn3/zpm2WpvFlRdBiQhkiqiDbM5L/x675NgLeZHRyafHt82MIGIti+7DZVDaVHACI7k
	T/SjKf/QAsw2hNMCGEPaVWcXZVQy0j/wNapqhWGVZyHik8pkZaoRiJ0wSFm0UHL3blWrk6n+FnP
	surw3B4ocljnv4hNqVoZzP18q5FxL4cuA8Z5tYDgz0GK9fh9sHsfx1GEeNw3VTSyQ2/5VMeQaxc
	aboNQYDuXbUQGCjB89LtmnGLyDb/TGBvyyqvkVciGECZSnZF6T7rZP2U1TTik1FhVYRoWfKOapM
	5OPVdbjJSVN4gLWto4aqah7sC9HjIeWuXcEVHrzCBZ4fmqVRdf1mMyCZeX4=
X-Received: by 2002:a17:90a:e705:b0:3ad:aa1a:312e with SMTP id 98e67ed59e1d1-3b41c7e127cmr20237965a91.3.1795697292077;
        Thu, 26 Nov 2026 04:48:12 -0800 (PST)
Received: from amax.cluster.local ([115.233.223.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d1361fsm35201528a91.6.2026.11.26.04.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:48:11 -0800 (PST)
From: l1za0.sec@gmail.com
To: Bartosz Golaszewski <brgl@kernel.org>,
	Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haocheng Yu <l1za0.sec@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] gpio: cdev: fix memory leak in lineinfo_changed_notify
Date: Thu, 26 Nov 2026 20:47:51 +0800
Message-Id: <20261126124751.3184158-1-l1za0.sec@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260922-gpio-cdev-stack-leak-fixes-v3-1-7a0c7a4299d5@oss.qualcomm.com>
References: <20260922-gpio-cdev-stack-leak-fixes-v3-1-7a0c7a4299d5@oss.qualcomm.com>
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

From: Haocheng Yu <l1za0.sec@gmail.com>

Commit 1feb5d39b05a ("gpio: cdev: fix kernel stack leak to
user-space in error path") made gpio_desc_to_lineinfo() return an error
when the GPIO chip guard cannot be acquired, introducing a new error
path in lineinfo_changed_notify().

This error path can be reached when a watched line changes state while
its GPIO chip is being removed. The state-change path may decide to
emit a notification while the chip is still present, but before
gpio_desc_to_lineinfo() enters its own SRCU read-side critical section,
gpiochip_remove() may clear gdev->chip. The newly acquired chip guard
then observes a NULL chip and gpio_desc_to_lineinfo() returns -ENODEV.
Driver unbind, hot-unplug, or device-tree overlay removal can create
this race with line request, release, or configuration changes.

At this point lineinfo_changed_notify() drops the file reference and
returns, but it neither frees the newly allocated notification context
nor queues the work that normally takes ownership of and frees it.

Free the context before returning to avoid leaking it whenever the race 
is hit.

Fixes: 1feb5d39b05a ("gpio: cdev: fix kernel stack leak to user-space in error path")
Cc: stable@vger.kernel.org
Signed-off-by: Haocheng Yu <l1za0.sec@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 5d53bfcdf726..1146198415f8 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2535,6 +2535,7 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
 	ret = gpio_desc_to_lineinfo(desc, &ctx->chg.info, true);
 	if (ret) {
 		fput(fp);
+		kfree(ctx);
 		return NOTIFY_DONE;
 	}
 
-- 
2.43.0
