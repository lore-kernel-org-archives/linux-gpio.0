Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035432;
	b=irU7pbAai2LKIw+rCNErcjo7Ar2X8its/SAZSIZ8OpPbCvIo4CETJgs9KlD2IIpHlzFH
	 G1Bu0vve0w+N4ls/TY7Vlvil/KN+rNOfua1IqMOVCBSzlh+HbQgJ/1tYBMP13KSjaSx5a
	 qIcin6Asq8NJAEhBaLUFJt6tvqHuKnzOGtUb4urYQK/q44YIjJtgETPPX9r8JfB+E15iH
	 Rei8lEW/TpNyLVBKvOy4Yg/qe1ArF9i8Fl5AGQK/rzIJiVR4VmtDmleNkyT22F7OKZLhf
	 HtiTjI5k68jssBr3c/tazW9fWm0hdNdd3zIiAR2o8yNyWwBCE5z//hyX+f5M28nEkJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lwp8t8LUVYUpnfQ5EdPfzGcZvgUEwhtKxs66E4lRwbI=;
	b=SJjJSJJfrwEeFctw9JKYMegDvNOcW27tK/FO7CvylHwpd9VkCQXPund28sXQDeSWXpSB
	 9G80F+Nhc/OQa3T2hzVikHXVtljMYC6+d+G11rdY73YyAnOLoHajB4gRxRWrnYEM3JAVg
	 HWLthdZpq3j1HGYbOPBWSWIeA339mAJ7o2aSX5d7ZtQ0GoN15YERKXXAThvTPZQmMMDCU
	 6ZGgGvOwU2OzmkEi/4IMoldRc9vYf9gh9JyuSHD9Gx8FNkk6B5J/zqiKOU86k+J/A6D2L
	 7SCQV33sXHhvZvoUQIWI/3DqSCT7tV6Cii/TXbnJQewUqjNJUtiEhrbqcLvQnXXQ9Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QAr7mGAZ;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40800606A31C
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 20:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40800606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QAr7mGAZ
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso14898895e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 12:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035430; x=1795640230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lwp8t8LUVYUpnfQ5EdPfzGcZvgUEwhtKxs66E4lRwbI=;
        b=QAr7mGAZo6JypL+RtfhirUL+sLj2PvWccXTaR4kYbvYKNoTcxulTK66WgbD9Gu+iXh
         yN8EmlcgYBD1p7CIKeb/+4ZmOzu32KJwSfqBwL14sT6cEJaKmVkD4nyu3D5upZ4bqbUr
         wXYZyLvH86tk/a4zlwa5UeYyhMjqDPiHG3/dr4Xxn/rZElp3iHtKOqWs5l4xitQNL0k6
         ygFEBkDNZiUpSoEwhGw9DARA/iFJB25c7cYJQsvs5L1ZhhxvnaLRZ6K4Yw5e65ZZVC6n
         Vx6dXHSWp1/ZcQLPwqbM1NffNVZ6AJ9XhWqapmwjH/kXHCgid5QktCyWe+JU01s4PNF9
         j91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035430; x=1795640230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lwp8t8LUVYUpnfQ5EdPfzGcZvgUEwhtKxs66E4lRwbI=;
        b=MXr6mxy1mFC2swBFwnid6tMO3VTOg5ndp55HJWDPSclbZT3v9dcqr60vgzFOvSEmUk
         OxtVdCds73QSlqZLwWyc8W8zY3572iAfQaU5j8KZSBc4nDcr2s9r24AKYseRF8QY2qUd
         dMYk0ugnnwovXo1ZAGrcaSBF2H6MaURcgTuQ37MAsh2g1lJsFMqX+CuyOyEE6Bbx2PNx
         uUxWuGCLgZ3jnbE51bBPjFO3dHdbPltPSRwroH8Uziy11TWSKzBQW2iKXDtqHB7j8NvT
         WweQe22KFPG7R4owzIkRRlBIIeVsErMfVa5145NhUmHy0mXmw3BbdhmU1WuPrZ8dyF9n
         Ptvg==
X-Forwarded-Encrypted: i=1; AL+hErHtQqjacJdUGXJfpXv3lLX1sEUWStN+X/GP09lOYQp72+miC0XcFSSmN/3HQ/N5m0lBWlz0a3ozlYDY@vger.kernel.org
X-Gm-Message-State: APuU4Z+HDNlnglxmo75GyQNZBnI7UsWpw91tFONgisTh+U+2zlBg5u1x
	j3K6XwoT53VvdzIIHUZ5aoKkQaIYLw3QefJ40j0L6GaaAXPGG9b2Uct4v55Y+TyE
X-Gm-Gg: AYBFou0aRjdGtqalopdOqZtwjebCdGec5f7Lagk5qeqYH7nXbzKb/+QBscrKdwYfegz
	EZldt1dX8yzq5X19wIdmBZ+LcV34E39PD9JTopV5E4OBo3cw67KfjxuYuAt9yoCIQt3p9YkDHsZ
	WhsmXTdAy/1QQPLk2eHX5NjdpCERNnk6UlTCZgNxfNbeaxYTlWNQjZQyKj+78jckV+nBFbOD2Uq
	cp5EtIhdaDoarIIhts6lWfYk2ROzRJIwrqVCKjPoXmBWG1agS51wdaJsAzu8hvL4lbh59BjGoyv
	tC8Iz9/lpOKdivwaMA+OaiWvltcKjd5TYdH1hoMYnH3e20tdgzILWd8zSovo4oMJo3dcxHtCEcc
	kQ5zs69YR0RoXIONFy64h/AS2Xu/Ni2Hf/zoUlqyUbl4X36ubmrF/rpGfS2fswfUT20CPIcp0y/
	VswShiaJQ+wuu4FZcWwt/ZJw25G6RiXkbxrvwKmuFit0/ILZ7n8iUiD6VT9lYiIG71b+/S1LJ/j
	UMEh5KhDQf2EHQ4DIWhSUYo7ThnwsV+5VgwhPVEH+NYDHX3msyktsE0dtTFsgLpu92qQjZ23dq7
	SUyFdwRj5IoXKmbseOf/r12qpPsK
X-Received: by 2002:a05:600c:1c03:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4bb7da1392emr80734155e9.9.1795035430450;
        Wed, 18 Nov 2026 12:57:10 -0800 (PST)
Received: from m2.. ([37.142.154.208])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7e577acfsm46582705e9.1.2026.11.18.12.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:57:10 -0800 (PST)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Michael Zaidman <michael.zaidman@gmail.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-input@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	dmitry.torokhov@gmail.com
Subject: Re: [PATCH v4 02/16] HID: ft260: uart: fix serial driver
Date: Wed, 18 Nov 2026 22:56:59 +0200
Message-ID: <20261118205703.49167-1-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-219657@kernel.org>
References: <sashiko-outbox-219657@kernel.org>
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

On Tue, Nov 17, 2026 at 08:49:47PM +0000, sashiko-bot@kernel.org wrote:
> Can taking port->xmit_fifo_lock with plain spin_lock() deadlock against
> ft260_uart_write()?

Thanks, that is a real deadlock. kfifo_in_spinlocked() and
kfifo_out_spinlocked() take the lock with spin_lock_irqsave(), and the
other users of xmit_fifo_lock must do the same. In v5, patch 2 uses
spin_lock_irqsave() in all of them.

> Can ft260_uart_write_room() and ft260_uart_chars_in_buffer() race with
> kfifo_reset() and return a bogus count?

Right, kfifo_reset() writes in and out with two stores. A reader
without the lock can see one old and one new value. In v5 both
functions read the FIFO under xmit_fifo_lock, as uart_write_room() and
uart_chars_in_buffer() do in serial_core.

> Does removing ft260_uart_change_speed() from ft260_uart_port_activate()
> leave tty->termios out of sync with the hardware across an unplug and
> replug?

Yes, it's correct. v5 sets TTY_DRIVER_RESET_SAVED_TERMIOS in
tty_alloc_driver(), as you propose.

> Can publishing dev in ft260_uart_add_port() before
> tty_port_register_device_attr() allow a concurrent open to reach
> tty_init_dev() before driver->ports[dev->index] is updated?

It can. tty_kopen_exclusive() and tty_kopen_shared() find the driver
by dev_t and do not need the cdev. They can open the minor in that
window. I will take both of your proposals in v5: ft260_uart_install()
uses tty_port_install(), and ft260_uart_probe() makes the port visible
to ft260_uart_install() only after the chip is configured, just before
tty_port_register_device_attr().
