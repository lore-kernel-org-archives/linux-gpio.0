Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969632;
	b=tkCTDkV9/iSwnY9dIFiyCAeRYs/Vs3Y0fIQ/LclrjiADL8NgGUX/yEg/SPkzCkqPa6uS
	 BB+k/h2TLhMAuTWz9Ci54zGeeXznYyVuBy+4ik4rSJqn1M3NxhelbP8IByUi0+q3AOVgw
	 eFfKauwul+91cwv71zvhlT+9+26KaiyYs9tlJXyybwgpXU44VyQawVOVDBR6H4ood6Z4u
	 XoU21dijjiJiIqX7359b4S+QqtqF6ereTEqCv1BPNAjA0hf6tgk7PQm9YSBp0xtMfGh6p
	 gaYVTHgGof9+VV8Y+F4BGv/FpcQwX2wFRxVC36C405z331wu2QW4GmN/Rjh2bvqp5RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oTHjiyDX2guT5VBDXE9scu6NOC96wb99UsVWoSwnSP0=;
	b=ornlZrgxKIO1ukraYeSNSy+fTOf+vgHd+cqfov+z4bHsUyDzNNWGbFRJMhD7mKlz/+if
	 GQZbqXRqXOeOkr+1c4ikDCaEr37mGC1eqFcMaARrxy3oKkDabEUfASJ4a+rLaS4MA5YB3
	 YuG+B860nbr4Y6jY4sKj0IGM4QmnB+k8uxis3i54u5NgVMN7dTNG3yQxZzVvU2TlxxtKH
	 h1EjixPQnYnLSjESVMl/XWwa6hqCwNyjczMxaU8Q6L0yu9YRFGdzcgfnNisMYGPnAMPFr
	 Pg1FyjM53RCwZf8H7d5dOUdQaXlbZuWkIEx0YMn6T+ZPu/zW/za5GlwVKaJBGm+vPrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RTQOMoxi;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521B3606A32D
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 12:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 521B3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RTQOMoxi
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso4153395e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 04:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793969631; x=1794574431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oTHjiyDX2guT5VBDXE9scu6NOC96wb99UsVWoSwnSP0=;
        b=RTQOMoxix56I3khgiwxSLlG6MqNj4SnKFN0SBhox6cEqvgnl7JGomA1wRtDOmcDzLn
         SMJbxP2clNS4vp9IEQIfNqOTQieTPb/o/DkCapHlrMzsPu6UpPko7DR4mpB3S63dhpsA
         yQIBpXjJ5HgVWdunVyqSVTnmQDD07f5uSMGGmNBys+TeI0//Lgvjg03DukZF8YSSjcXa
         6iBj+12ApuubwP4ZWxCaiBMjqjQQa1joZPEi92XjrxUdybrBwYF7+rkj8D7F62pL697Z
         Dm7VhyarpKwTU6Om6ty0AEYYTNZ8YrIxmj2NZuNBefTI3ypgkCjCScMTGyRuYCr0YEb0
         v0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793969631; x=1794574431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oTHjiyDX2guT5VBDXE9scu6NOC96wb99UsVWoSwnSP0=;
        b=c3/j2U21GJfNyfClmXcb8cJC7W1M5FNVNsp2bTx6tELLNSDrXFARVP//rvddvpEVDZ
         NYp6o1rMxWRYBpUVssi/eTNYCVAfo3PUZ2rWbWHstmTci4GxafOdLZ2HivjKsQquxj6A
         ZW89rZwMAoN2i9fFXs5ruDTZTug+8KL99WFfd9JB0FWx9qB5Efj8M+KniMT0559mApgf
         PZt0JsJP9tjs/2LriEKR7gQ3M0OchFMfZ+PocAzzg6qBk8iHA4V2DUuTFauFhn6LvqCT
         EAtWfbX52/40MDiIWRzxvR/mG+aVoGGxB5LgiQdw6hxkc/KtU2BFjOeXaBTnDIfI7uve
         cahQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNLsliI91+S/5rDv4dbDFd7YPqa2HXcWyi3eYmCJ6jaPeFX3/vjTf0F2CmhJX4hrTC1LLZlBDNVmVs@vger.kernel.org
X-Gm-Message-State: APuU4Z+m8XDdz1yPvZKOlgttTfucrnq5zIWafXfz2/2NdTY9UtmBn4xj
	bKDWaxYU4t+TTsK/BHHa5+sVZQGtOZxyhWCvMQp15stAEYosP5KkTiMc
X-Gm-Gg: AYBFou2Gj58/JRLrzfLNt8jtZ6WCoHhxiMx1EI53rqCtJ+9+P7qvkJWdfoPGlqG0a92
	wDv5M5hDIij2x2DPonMpjCZkK/1AkZ1aybUrZlwXxhIsBZfYkBzwV2xCc1Hf0C4M0GHtcNSiUid
	qnOEqq0rLHhcEcSPjARzR2YmoP0/BbaeN8BXdtTJ76PGVPtZ14FnhprJWPgNF8Jc77WjQZ3WdLh
	EimpvHt1uNiYrVH6wQOzxWHB7rAJtvrzhZJPpn2+9pksiMm0RfUXC9OoX6DTSSdo/YcQiYxjC/2
	e+LK1QXLOIroQYM/dyuAw/OAYZHnNvm4TXyHompZFF55xF3XPrs39K04kCy0di5SDnl9RiCzAWu
	SC4y024m2ZMkJscEKQ4kAwR4xbs3vrokRqR3wxVa8N36mz2i857c8nyEwhugG4JafOIal0qIvgV
	lHQVzp+b5GAtHFemredHddmYRg0wTuLLXuw6Y0dVRlONxh5V2ZQSPiG3NVmUq8ly4phaJmHuRZv
	8cjwiREqv0hgh+kZqExrxoqt13L6usSRVEvvv+yKG+tbuGfS3pzwlpC4PNo9W96Z9FgViscmkcf
	eWuzerZVPJ+GbwF/KCBwew8EC1rg
X-Received: by 2002:a05:600c:1913:b0:4a2:1398:dd05 with SMTP id 5b1f17b1804b1-4b6de0ce791mr41196125e9.16.1793969630568;
        Fri, 06 Nov 2026 04:53:50 -0800 (PST)
Received: from m2.. ([37.142.148.124])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b6e1b5d676sm58687815e9.7.2026.11.06.04.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:53:49 -0800 (PST)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Raman Varabets <kernel-linux-20260610-80b7ab08@raman.v1.sg>,
	Germain Hebert <germain.hebert@ca.abb.com>,
	Christina Quast <contact@christina-quast.de>,
	Rio Liu <rio@r26.me>,
	Bruno Giacomazzi <brunoceg1@gmail.com>,
	linux-input@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zaidman <michael.zaidman@gmail.com>
Subject: Re: [PATCH v2 03/15] HID: ft260: add GPIO support
Date: Fri,  6 Nov 2026 14:53:40 +0200
Message-ID: <20261106125340.18483-1-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <7a3kc2tj2mh62aklablkma5teiinm6b6z2rlvrfwk76xcnd2rb@xwsgziioxz6u>
References: <7a3kc2tj2mh62aklablkma5teiinm6b6z2rlvrfwk76xcnd2rb@xwsgziioxz6u>
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

On Tue, Nov 03, 2026 at 01:53:26PM +0100, Bartosz Golaszewski wrote:
> There's a lot of sashiko comments to address but a few additional nits
> below.

Thank you for the review. I am working through the Sashiko findings
for v3. Below is what I plan for each of your points.

>> +	mutex_lock(&dev->lock);
>
> Use lock guards from linux/cleanup.h.

[...]

>> +exit:
>> +	mutex_unlock(&dev->lock);
>
> That way you'll avoid this label. Same elsewhere.

I plan to do this as one new patch at the end of v3, which converts
the whole driver to guard(), and to remove these labels there.

The reason is that I also maintain an out-of-tree version of this
driver for kernels older than 6.5, which do not have linux/cleanup.h.
With the conversion as the last patch, the code before it becomes the
base for that version. It builds on older kernels with small changes,
and I can simply leave the last patch out there.

>> +	dev->gc = devm_kzalloc(&hdev->dev, sizeof(*dev->gc), GFP_KERNEL);
>> +	if (!dev->gc)
>> +		return -ENOMEM;
>
> Why is this dynamically allocated? Make it part of ft260_device.

Will do in v3.

>> +	if (!label) {
>> +		ret = -ENOMEM;
>> +		goto exit;
>
> Just return here? Why the label?

Right, it will return directly.

>> +	snprintf(label, label_sz, "%s%s", prefix, dev_name(&hdev->dev));
>
> devm_kasprintf()?

Yes, v3 uses devm_kasprintf().

>> +	hid_info(hdev, "initialize gpio chip on %s\n", label);
>
> Drop logs like this, they add nothing except useless noise. Same
> elsewhere.

Agreed. In v3 I drop both "initialize gpio chip" messages.

The "enabled GPIOs" message moves from info to debug verbosity. It is
off by default. I would like to keep it there, because my hardware
tests read the GPIO mask from it.

Two messages stay at info level. "registering device /dev/ttyFT%d" is
the only one that tells which tty belongs to which device, like
"converter now attached to ttyUSB%d" in the USB serial core.
"chip code" was in the driver before this series, and it is the only
place that prints the chip version.

Thanks,
Michael
