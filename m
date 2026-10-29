Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300814;
	b=BQqzYyEhgAuVnjMrN74QS0/SaVNhCI/kgVaQas8uGQTYi3Ru6yzpRoq9ezHK5ctLDT0F
	 Uox9qFhfTFjsYVxQqDB3fCfCDKiMiehRJ2cZbqa2b422j+XkVjE5yjujwFnf9AQXtzEgX
	 3BZTMLWt7d6/61bzSGfkcaSwOwo15SseqEPPnUoay8/pE7KjJtimK2JNi8XjNyZbg3NQO
	 qceReAxbCJIOChwT2mqrnJkDdSr0lzQS4MsSyK1BTHSLHHlLRCK2q+nSKz/rx/2c67UV5
	 6YJa7vfnkkYJjvF4esh2mzv6Uh/iZLaOjSvNc3Nl6R5/ALI3Y0trKdj6Pg/90iZ9NVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=EP9nzlx+H2sk50SyAzN5S+n1xSKA5s/U/jjen9Qb6t8=;
	b=xBuaYrnFt95cdyldO+VGNqDU56ocn8jGS9ZUYE8luBBqNRS0tWZ6E+FYg8zJSbZDh9U1
	 DUc+yrYgGng7/8YpQClhRKzzOryphteDSduw28OfZit0mkhrCCTaUJM/ty+dq2we45nrk
	 CNXi8W2YbBTVCDBfg82JEAOcCMMKV0dOyePv7RKisPp5/dHMUlJYmDtbuhQ9UEFwja0rj
	 XSaF9FCZMQvBFizQTaGmqQBEj++3IqNfSMOZUD0ID8lErlvkHzzqxT4nhV4UBueqSM8ZE
	 mbRWzXLm3f0C4vYlR80w8J3Ut6hEXJnD+rQfwuBgNWOZdw5xEcxXhyT7AUoLrZRp0Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sUCGZhLU;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BAD606A322
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 19:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3BAD606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sUCGZhLU
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a3c08d6928so3379550c88.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 12:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300813; x=1793905613; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EP9nzlx+H2sk50SyAzN5S+n1xSKA5s/U/jjen9Qb6t8=;
        b=sUCGZhLUgkrJa6LcpnFAjUi0KZ0UNBhyd29LD+BS3JUsrWzKFXGsQlqTNkLltIqiSo
         mfd5wLdi8VA4TV/rYjdALme2PysjVDVvV8BFIkQK9aCCr6rk/jIMEZe0m419NR2lo1KO
         webr2YxaqRMbHEQV6WaaTx6SlasyGq42m90aeBfL4X+FgrYcgyFMKSWXjRMfBTuK8QAh
         0jABwzKWmMj1hqeTVp1qmfMD2MeeG04Pk6VC4V/evUvRrT4106DBo1xZv9OWmiyqG/uE
         waTnra9hzwxe7Bj41TjMpSjVngpTD9zBZ+fxtcB8lmqgNrAJGEUiah3IHSkZo4+oDu7V
         0yXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300813; x=1793905613;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EP9nzlx+H2sk50SyAzN5S+n1xSKA5s/U/jjen9Qb6t8=;
        b=HAV0RT53C6uZtBx7vbSJbC2JmkFH8aVFuAz1PTL55YbVnH0PlE08w4jSRqLGYAHuau
         pYRE0GHaHENRslluSs0fdgRUGCC4Z14pFD4rfmFDtDrhJ59vjztLlEu/M6U+kCs297OG
         qekyQuGQvcN3oXl/vkLVZE/QOvBRSd+kTMpeQLZcq1cQ1mE2kpWxoi/kLK6W9y5J8Kfi
         9mIJIO4B0DvurqlShnyoZCyiG7LtbYoQLSW9fBPgL3RTwTx175mQ+Nty1XNkLnhGXWWY
         y34WPKq1PJHGfLFXP0dJbZlBUgG7a1dJYDUEi+M5g7rNBZVPkBOf94GLgNRMNFgPZBW0
         psag==
X-Forwarded-Encrypted: i=1; AKwUvBxhE9Pci2ruzCXl1AglWzi1HaL9dpaY6R6pCxY2KeJiLzwSNF9xppUFaOhrH+qlYdr4gGLRz6V7JgK8@vger.kernel.org
X-Gm-Message-State: AFq9FYIJTRdfEOUYyzo/Ksobo4q4CT7Ww41IFhGwS9HNLonzfiiWgjD6
	Rzf5YDmiWXBmdvl9FmgHZTPB5KD/g8fidoq2AIaVHPj34TUJnW+3r548
X-Gm-Gg: AYBFou2SAKucTtXTFSsq0M/WUir6DrQH6yw6ltSx9sMVja2Rq7kJc731FB49rlbgSX4
	PZpNadpas1sOiYI14CbnAGOB5+ssu1xM9nqsfJ57mrV5//IhQfjsHvoQTLmzzCijI4XlftkVWp3
	kQsmNozmR2i0PncA4SQWXc7Cq5lnh5ldCvpag9XkMac58ixisRcjq04w1OYpU21Aur7S0b6itTy
	3gp2AWP9CWzQCByLynoJ35Mgef9lxiNji3wttwDYP90LPnJ1g/xyFqgYMkpORXDO4i3RcJ0+iav
	EMBpbeTmJ/kJwS5NiIUZ7+m4NEHNHqIOhsUkz42SN8RMjlXBi9zrZSpC9iC+VavXAEX+2psEavI
	/ChMDLzw8em0fPK+HMQPtpRSDJGoRm1YhCmUmXmsQCrGCCSzxjdXH6++CZ2HZf2Lt9EpMWet7A0
	CyKRdwL4RtBk3tkAfWrA+EZuQ3FtmV0I9e49QdHE40X++sVSWQVtyxeXAvivg8SZa22moBVnxM9
	b9IUckJABKkGaaiaBjqnFS9j732e4ATWz9fpWQClI9jHRZQGawT6/DCMdDHriL7TJFrsej8Rodx
	s7pBTI75UTHcfSscVvYVkbSOSk2rqcrQ3tDYV+xtArsQZk7F9QZ6kGdxkmkRnDtpYjdH4g==
X-Received: by 2002:a05:7022:ea8b:b0:1a0:f970:4f5d with SMTP id a92af1059eb24-1a6ce4ea2a3mr7493584c88.17.1793300812571;
        Thu, 29 Oct 2026 12:06:52 -0700 (PDT)
Received: from localhost ([2a00:79e0:2ebe:8:8310:80a5:1043:3f70])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c2e9dsm766922c88.9.2026.10.29.12.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 12:06:51 -0700 (PDT)
Date: Thu, 29 Oct 2026 12:06:50 -0700
Message-ID: <a23c924469bdccf3417141c904713a6a@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	soc@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 1/4] gpio: sa1100: register software node for GPIO controller
In-Reply-To: <8bc1c573-bd4f-4dfe-9d7b-8b17d386ada7@app.fastmail.com>
References: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com> <20260706-sa1100-swnode-v1-1-332759bbd930@gmail.com> <2a561a27-a3bf-4cac-a4dc-bfbc5c859f45@roeck-us.net> <8bc1c573-bd4f-4dfe-9d7b-8b17d386ada7@app.fastmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Arnd, Guenter,

On Thu, Oct 29, 2026 at 10:26:05AM +0100, Arnd Bergmann wrote:
> On Thu, Oct 29, 2026, at 05:23, Guenter Roeck wrote:
> > With this patch in the tree, the qemu "collie" emulation no longer works.
> > There is no console output.
...
> Hopefully Dmitry can spot an obvious fix for the regression, otherwise
> a revert is probably best so we can leave collie working in the LTS
> kernel and not spend much work on that.

sa1100_init_gpio() runs during init_IRQ(), before driver_init() sets up
swnode_kset, so software_node_register() crashed dereferencing a NULL
kset pointer before the console came up.

Only the GPIO IRQ setup needs to happen in init_IRQ(), so I posted a fix
deferring the software node and gpiochip registration to
postcore_initcall (verified with qemu collie):

https://lore.kernel.org/r/20261029-sa1100-swnode-fix-v1-1-112f4d83d191@gmail.com

Thanks.

-- 
Dmitry
