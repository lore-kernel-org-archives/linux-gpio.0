Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284113D9DBA
	for <linux-gpio@vger.kernel.org>; Wed,  5 Aug 2026 05:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785909334; cv=none; b=j98/rJkRr/TqebRbh4FeKCCeY2G4hPXNiRmLHPfj+sY1013TL6+9bQfC9Ty0PDLHU207smqIL/JP1tFgqzC/HEEGpjeZO/ItKjpD5okQvvpP+uhhopeZ5snr6YJjVZeX30TkHRurtpRevjEAM7Tu1rMEWmL39wLtNCzgvUCm2QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785909334; c=relaxed/simple;
	bh=R+hy63bnGwdOKhRFB9Y0mZkQ3+OfAzlsGgL7sz4SYaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gZAu6cP3YyigHBz5G0bfJoLonlLYwpkJKsZmFIcjQVTGRSL6FAMHo8pBT72C4AHLFdWu7N+CDx9FHCkg5z43EfkzeRDppqkyCpkYaIjV2bJglbcdAXJCBJubnJTShQSWmRGmBj8UVWkM6z7+z/z24T0zGoHqrHFgqVVC3FrMS0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4Z5jOrk; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4Z5jOrk"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so624806a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 04 Aug 2026 22:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785909332; x=1786514132; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5VJVEduWNc70gjMM2xxRdfaqd5aIkPPMlpwcCO9KZM=;
        b=M4Z5jOrkGotBANOtZPLQymz1No63uv0q25gcqdhyEGcBYmqHCLNDWk+pW2OB5uvO6v
         cj7i16PDnWJN/8g340ChhS3zzS6AMrN3BA3QqeUs1A8uXaL+Tl/vYLR1XrAYkvSjv5cs
         rxl/iFAfjIB/gbjgN8pcEu2+rl8tN9OKrgzKzXE0NLeug5+5Y/QUgQTdKaYFjcGyiEfp
         /BOw5dHA7zQnzJf239VLNSAcM6j2WC2V+3+ZaxxpDCnUPumFpQYUfovhGH2A8EnDUc+Q
         Wtw4h+9PPKEdky+wwt5H4XW7PzZ8kKosCBZPU4TSl2mMJue+czeEgyJaJJu94RyCwEoJ
         R5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785909332; x=1786514132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k5VJVEduWNc70gjMM2xxRdfaqd5aIkPPMlpwcCO9KZM=;
        b=sMYbBWzyeBtVMOkk6RNBBQsx72xhmzTnUIpZ6bDfU8McMEBs61aF94F0j2U0nuKgzc
         9iN/HF10bi147uE7Ie+0cBDxOz0n/fVSr47dmLoNTPcWJGGHJQNYgVlR7eJGJD0Dlq1+
         dqCfHqEMV3AWeOaLkokKFjzAWpeIQRo7Ga+RrFzXTk8MRThfwcrZtMtj0A275nNwbBX8
         pWSvawlwe8+7UbqIU3D+lNcslDTbkvYR1qrFMbfAdOUs13fZ83YtQlK+saMUsM8QPMb1
         s9DNyrzYgkVy7GmVKSidfaias1D9CFxAQ5Sm080ZmOheMq1qoXiL2uVh7cYQz3txQE5f
         Ht5Q==
X-Gm-Message-State: AOJu0YzoRmlIJwVQFRBauxeRXD6j2QFrrkc7Fix90vDqqIYzb5zAXunz
	LxYRd9BxnmmFmp/oi1e5/y5owT9uuyLBUPtcyewkTauwAR9DY4NJwmvP
X-Gm-Gg: AR+sD10xk4n70oj7k//cFhcluL74T+FCCAvNcT0SceMhl5i7w2tDgpkjW8eihJGOo3K
	SdHdO67sZkMAzkHsLXzvv3/g6X3u5XSs7fuZtnlcYQ7FAkPxpnnk65kseVzX7nYtZUuv1uBNieg
	3gCI5d00KvtKohEXZaragWXDTMmHFN0QcgUQ1zP5qi61IAXMq1NFMlmY0ymGkw7o+gwZ7U1jtzd
	g3PDxOSlysIXfFYT6hRtmig/A0xC2mh0ySkPi4bkXhli86Ok8Qs6W1G1fq0PvhR8BAJd3hrlrnc
	MRtjcATFFoYFtxRlyO6SQFRyajFsBsLlOmfXjNZuDBJGS4C1QKRjQGw/QujuhtSHvre5hhdhyeG
	n3MSlEQjFMU2Dhl0bL4F0gLZuhXxgq1CLnt9Xl9vcTcodSH8KdFgz+ILRIheXomORCx3Nwjz9H+
	quzLcpm5vnLEteEWkcJjiUZEyvJrk3EnCdCUN77Zu+lj6Wc7g0H8wtzP8mkVfg0LH2bMF+2z9Yk
	DDq12mkyqI6HgHW968FIHPoJRDm
X-Received: by 2002:a05:6a21:a04:b0:3bf:9aa9:b2a4 with SMTP id adf61e73a8af0-3cb85ef91f7mr5390244637.20.1785909332467;
        Tue, 04 Aug 2026 22:55:32 -0700 (PDT)
Received: from [192.168.20.42] (115-70-157-242.ip4.superloop.au. [115.70.157.242])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867bc261sm11717163eec.28.2026.08.04.22.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 22:55:32 -0700 (PDT)
From: Tsz Shan Chan <tsz.chan.dev@gmail.com>
X-Google-Original-From: Tsz Shan Chan <tchan@jacques.com.au>
Date: Wed, 05 Aug 2026 15:55:15 +1000
Subject: [PATCH 1/2] pinctrl: sx150x: Return IRQ_NONE if no pending irq
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-sx1502-v1-1-6434d51fe909@jacques.com.au>
References: <20260805-sx1502-v1-0-6434d51fe909@jacques.com.au>
In-Reply-To: <20260805-sx1502-v1-0-6434d51fe909@jacques.com.au>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tsz Shan Chan <tchan@jacques.com.au>
X-Mailer: b4 0.14.3

The driver currently reads the interrupt source register, writes the
value back to clear it, and always returns IRQ_HANDLED.
When the IRQ is shared, the handler should not claim interrupts that are
not from this device.

Check for zero interrupt source first. It no interrupt is pending,
return IRQ_NONE and skip the register write.

Signed-off-by: Tsz Shan Chan <tchan@jacques.com.au>
---
 drivers/pinctrl/pinctrl-sx150x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index b59d913513d5..015b1d0744e4 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -550,6 +550,9 @@ static irqreturn_t sx150x_irq_thread_fn(int irq, void *dev_id)
 	if (err < 0)
 		return IRQ_NONE;
 
+	if (!val)
+		return IRQ_NONE;
+
 	err = regmap_write(pctl->regmap, pctl->data->reg_irq_src, val);
 	if (err < 0)
 		return IRQ_NONE;

-- 
2.55.0

