Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862689;
	b=TIPi922HM5Lmq8DBlQT2+slmYKdL/RHdYroO7B1Ggyml/RBptkOOi3a4sk8zX7Uprfat
	 pZC0Ww6ChpDWgsdZNQ+OBySeMNFCJl+LJLI2u2UCM6ph7V398NvugL//LGdq5hPShJm6r
	 EFbhC/1Pqt2Dzxr46CEmqrJpazM8AhWNJNsBpFJajY4O2dMfQ7BhvbKC7h1VcABwnPdwo
	 53g+UvNMpZIwfFuJ4MBOrqYlj6OnnikRtFV2Oulm+7S9NxNNvWXgvKQFmNVWlqbaeUF/8
	 qVeUwKxIt0HqGUYedJxeGV4epu/HpiAY5Pxc0X10a57Nvd+0ouRulV9034euOVPArKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vr8LxlwRGl/SVKMwZ1OihzYbqfOG5qsqLHZawnVcpJg=;
	b=AOxT65Ij1No7d4b5mv1V36zlLufnHqPKgikMtSnXwlUv4kjo+Vj9uQqxJPFlHqWjBB6l
	 591rzFl7EQXDLvmgQunLzoDvuyKw0iXOJ21VbqeI2+pgJwDWPZXXc+D3GZIRgA1n4hjv8
	 W8Tyg6vG0iGXZLfXMnBXZlUpCJEWeZL8j6KyD53XWaWu9ojii+AVklrku60uLv5WH0yjF
	 zKQ8B0tYUUkqYqvGPf/RdsIhM5pbT835ZmTQ9Kfk2l25vSZI3w5oyyGHYTK5pgkjaUmD+
	 iBQi15iKLgInyovZbJM5TwFdyE7mEN8KN9F1QaDc/2GUn6tAgA1tDeO3Gumr9jJVmjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xhfpB4p/";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674BB606A31C
	for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 20:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 674BB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xhfpB4p/
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso23198275e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 12:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794862688; x=1795467488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vr8LxlwRGl/SVKMwZ1OihzYbqfOG5qsqLHZawnVcpJg=;
        b=xhfpB4p/FLz4tPvQ4XDyzPJZhYbKdby9eMFjsG4ed6t2AZa3F7CPzOfipZSOTimeWe
         BcDpq6gokbNTxIQ9l4fnGfjfFt29zj3RD0h6lHh+vJ1bX552MblcNRz+J8927R5ZmjeF
         iKpG54++B5Tp/HqvgFsBZU/VNWRkvyP+JLjtw/G/z314VyLXrSJcxdPsDrmr/1FXdlvg
         DIdw/tMELU7KsErDToyfosjf4meSG+J1RxQySHwdKjVeXk503qOmotvoqiMa9MiZS+ON
         XrDB4pfb8+ohnHUAfF24YjeIm1F8rDtjJQd8EA/+blfE98B4+XJy/aO9+RNJN9y3qjfU
         QxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862688; x=1795467488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vr8LxlwRGl/SVKMwZ1OihzYbqfOG5qsqLHZawnVcpJg=;
        b=AUR+3VFoMRQE//sxBKc2xpUrCbHiaImHTJ76bZL5CizxQpUsrcc1r6x/JgZrAhnjHI
         phnejFVB+M7J2Resm033AfsZCt0L460URsRn2Yf/k+13ltAN6fjp9kDMxlHiD7Up3l6U
         fNwdAVlltog1qwVnoF+RsycUBnezGG9fiP/H/ryhLcaVZM0GZ7F7jgHZ7Ot/KsSOJvet
         sHnU6lyVTWiOds43vc7pUMbJ62M9Zvjc1RZ+XPF4AyeilTbOmFxMd7CByUacUPhbfICe
         c/cWC04aIMvDJXSdz1iX4xpFxtogCw7+P+pkWeN+hPC4xtzvUg1yiKp+vPVpfc1aGFCx
         Ua2A==
X-Forwarded-Encrypted: i=1; AL+hErELJKjdNI9Z0LqC6e//dd5Km+zuP46H9UTEgeqhxoPVo1YvebHdvO2DwmTa95GM2kLb5CwbN01zQf6I@vger.kernel.org
X-Gm-Message-State: APuU4Z/VOJgrKLOYpQjGEh+XO962RnkmIX7B9+MXQIM9W+6Ab5a9IFGb
	nv4rXUnjd3nHSl1y2CnqlbHG+iWl08c1oFU9u9/biGhuSS4eqTtHPoSD
X-Gm-Gg: AYBFou3Whhs63yPamctCyhpG3K2dHb3K5qK0raxNOfxzQwDB1LeGR438U0yQpHUXrQz
	jYdYXs2IsScsUyRhMefs9oTaO97kUEUmKwASJkMCIjQsT0PscmHtz2queTVGBhCHbvlVG/wdkg8
	wTraQONY8EDpD3j5zvTO1I1+f+U5rH9wnrmdY6ecg5veml4PXZSfUtp+4EbHp7O4IG2h6rWNoR3
	jSfen9NqfpUV3sHIJ7hUe/4CEQQxCzIWHYQ7YfDnNBu01qtIgG3+xmrAuM2TPLHJNKRpWOujApu
	5ewccoccfEXHHJ0txPNqDEJr4dyI8wuIcybPaVq1p9KGiFBSkr5fAnfyzACUft1r2+JvLBMg8nT
	0fOQkF1ftQjMpI/EPPnXQXtwEuDc4FmqnARTF7tQYOWnhUm7qavn0yJHBra5vRJ2ZmrArMsFXIW
	zwAlbBmNQ0gg5vZ4ni02nL8z/FxtavJu+sdEOfc+kppCpdjgF+z7hWhUPzynDDivasUe5uuKQvG
	nbqFTUbeLnRJpytRFtOliDlL6Yi26hIpyZgJXHFx4p8u0D05kLDxGzsllF0lJ1gfyJRz8+sUtfp
	Nl3CVvZbh0Gb7aEkO3fdM+N1hZI=
X-Received: by 2002:a05:600c:a00d:b0:4bb:693e:4c8e with SMTP id 5b1f17b1804b1-4bb693e4d5dmr149922355e9.21.1794862687584;
        Mon, 16 Nov 2026 12:58:07 -0800 (PST)
Received: from m2.. ([37.142.154.59])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78418853sm20499255e9.8.2026.11.16.12.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:58:06 -0800 (PST)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: Maarten Brock <Maarten.Brock@sttls.nl>
Cc: Michael Zaidman <michael.zaidman@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/16] HID: ft260: uart: add modem pins control via ioctl
Date: Mon, 16 Nov 2026 22:57:50 +0200
Message-ID: <20261116205752.18800-1-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <GV2PR05MB119417E6491EEDE07003C52D6837C2@GV2PR05MB11941.eurprd05.prod.outlook.com>
References: <GV2PR05MB119417E6491EEDE07003C52D6837C2@GV2PR05MB11941.eurprd05.prod.outlook.com>
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

Hi Maarten,

On Mon, 16 Nov 2026 11:47:46 +0000, Maarten Brock wrote:
> > TIOCMGET and TIOCMSET work only while the modem pins are GPIOs, and
> > return -EINVAL otherwise.
>
> Without checking if it is possible at all, I am wondering why it would be an
> invalid operation to TIOCMGET the modem pin states when they are not
> GPIOs.

Thanks for catching this. There is no good reason for TIOCMGET to
fail there. The -EINVAL came from the Sashiko review of v1. In v1
both ioctls returned 0 when the pins were not GPIOs, so TIOCMGET
reported every line as inactive. v2 changed that to -EINVAL, which
fixed the wrong answer but made TIOCMGET fail.

The chip does the RTS/CTS and DTR/DSR flow control in hardware, and
no HID report gives the level of these pins while they are in UART
function. Two things I checked on hardware:

- For a pin in UART function, the GPIO report (0xB0) reads 0. With
  RTS/CTS flow control, the CTS bit stayed 0 while the peer toggled
  RTS. With DTR/DSR flow control, the DSR bit did the same.
- With flow control on and no data, the chip drives RTS (or DTR)
  active. I read this on the peer.

For v4 I am changing TIOCMGET so that it does not fail. Lines whose
pins are GPIOs are read from the chip, as now. A line in UART
function is reported as the get_mctrl() comment in serial_core.h
asks: CTS, DSR and DCD active, RI not active. RTS (or DTR) under
flow control is reported active, as measured.

TIOCMSET does not return -EINVAL any more either. It ignores RTS
while RTS/CTS flow control owns the pin, and DTR while DTR/DSR flow
control owns it, and it sets the other line. So DTR can be used
together with CRTSCTS.

Thanks,
Michael
