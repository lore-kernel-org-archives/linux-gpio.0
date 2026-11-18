Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004753;
	b=p++X397AeaIOtugfUeFKo0PTQpfPN/OXULdxbPAu0NiuRMHJkwdhj6QT/gq/I32V5sUO
	 eJ8O1RE3gnkqCAoEtxEy4v3PlZBQ85GR317oHaKe00WoyRBK1vKVC1Z7UOZ/Mc3o51Fzx
	 9szCcMI8xPzqrJx3lNUHIWwcSlCqlo3YuxKOanNu5S/c3wvzFF+fTpHIVkdcEi2jFOEtJ
	 wy8fqjh91MGdCz8AxHsR/JRaWCJHt1QPUhNrSMhIi7Wr/St2qDpU26LojCSXDd9B511gD
	 wV4Bx/Ke5Btaj8yILk+ENBTjvwgXzqtRSsBssqsgE0XHCzYcfs0d5h5jO1XAw0o5vig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Content-Language:To:Cc:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding;
	bh=oMz2CiDtzW5Zne4K7pAS6FAEFfgLQq+HM5a99lHm90A=;
	b=ceV5m51xdOgHejd3S+NigbDipxdF5IRVRJQVHKWfRf+umRQ4oaY3e5yEcvWboknlPo3H
	 pSBQKTRdVlTTDBrGBeTRhWO7aqSouAKpYftkHFHVqH26cyhkOzdrxvmjEpIbFxpvnD0ON
	 0iUSuGBhmH6hf1KvNtxgZCY2mQGA1qeP1NMMMgfYcVAbYaATC29VAuSTHM2W/3/GK6X7w
	 UoPTcr5L3R2T1XiUR8R9rI3cSs919QRjO5UO2BEIas0jHiKxKERO+L46pAiBihtzhKSSc
	 Jrhm/AP+kpUAGfwxVE54g2ZwfZIHEmtKmjydB+BS34KQu04aMOIsMCuayRIFQg/NUdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=F6FJiz2n;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12811606A31C
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 12:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12811606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=F6FJiz2n
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a42b34e930so659949f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 04:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1795004750; x=1795609550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oMz2CiDtzW5Zne4K7pAS6FAEFfgLQq+HM5a99lHm90A=;
        b=F6FJiz2nPhgqSo/+m2WKDy9ytO35E/fC6XXOX9OLDh2Itgt7iO0frdmN0rD1MRvfFc
         C2tUElLmUpGM3P5pKH24bzqhG235Hoptq8p11IERSsySAi7aws3BqX97MRogBLo65D5F
         4PC6LI9VaZ0Dus0KtaPWcp3C3Go7FxZxXSCNxWYBzJzNxRVjy1gIDlO/8ky+NtgiO8cu
         1SRQZplGc9KVPelEVgbUgS0sPIlKG5XAtJ2GbW77+CLqBG59jfSqnTquI1v9tKl9uYnq
         tjQWBdPWdX9DL4MJZA1etTUNckhzCPWk7ZMxN+peThctsh+H3E624x2LLi7xju/m771+
         cVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004750; x=1795609550;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oMz2CiDtzW5Zne4K7pAS6FAEFfgLQq+HM5a99lHm90A=;
        b=1p01KqK5XL3VQ66zt65ipsh0uT7k4KmulUDVr89OyJb9tLmMyI0NnoC778+p5MLS2T
         uQJpq4ClVPN3xzT1LIKM3znzI63yOKJtnvYLLeue4wC9PZkgqcBffmrcj4JJH1T0tYDz
         QtKIsGQyy/eeV/QDfHybGn+4Dv7vZwgg0bsmCGen7Jvg+O7K7jH/HEnGpnMuFGAcp8et
         9fyJr8AxkdJs+Q/IPjR1eLm+tcLIXGBhzSwkPR3Zj8Pz9aqyElUW5dcpj0xqtP+ReHId
         L1NcHBjdpB2xDEuDthwEP+tLZHMApL2sPDs401qbR7F6uZ2Pqqt2iOGexu0UDE/5gBlV
         eoig==
X-Gm-Message-State: APuU4Z/oL2PFvcxL5goLWKY9zcSM4ShVBV3Iyw1SFi+VlgE7gNn8Ex2W
	2jEyrnA8SEdpv992xBL5rMvUmfDuVw+pnrF84iNvXimV+kibyVj5fWhOFW+gHy9t/+iLjPxfbtp
	5kvceS04=
X-Gm-Gg: AZFdTZchAAxvlvSC5jac4i5KDT0WEjspDmK+RCz2qSxdLBQVWF05HXJdPjtKdC4muzG
	8FZdNyIN9JZ0slYhVrMb26pBZwMHNc8GVBrL+58EsJ0t+pvAxNu/5BdzEWW7zvTPFEV+fKmNG+K
	N/66+bxa9GNWE0Fg7jSbYLiiCUo9LjOt6Qf6KATnQkuTfN6i2krUSzXkgCyvKIUzL8Zl1lzz/kL
	uQjsb1tvH+j5Iylbrc6Hu8ZqMGZ002jQotiq74eMLGfcYn38RaaxGhkFIYpUlHUDaaYuIGeKLSj
	5OWwhi57sM7iTSX3lwj46j4GYZ76AzpUZ9yNNaz201hiYwo4cWtR7JracuNU1mqQHZMCz/P7YY2
	MR4pcMyUEscyVsjJqS226V3WxWxInt8eo0Cat0X0JwgVKDFr3scyaCYPEemYv9B4WQCbgMrOMyr
	OLF2svWjDZ8YgkOYNjk0jH6KQQO5e0m9rrTJ57L3aqoUTpOHrmyDs7RQefK6DXaN+QIf55O3/Z4
	n3vCwn00B4yBMzAT+PXOdG2FkZwqB0C/ELlK5tgfbC9ZFkxnFFTSk64tuJcw8jcteWrYdG+Yrm3
	qB2wZoTaBSTMwg/EhYSnBOTrs4P1f1ZumOrUDVeNdVCcR5X0AVFAoJHja4e4sLuqhbsbIZNUfXD
	8zbxY1lLWXlNlfqo=
X-Received: by 2002:a5d:5888:0:b0:48d:ff71:dd87 with SMTP id ffacd0b85a97d-4a639475750mr4937737f8f.17.1795004737887;
        Wed, 18 Nov 2026 04:25:37 -0800 (PST)
Received: from [192.168.2.26] (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656095f2csm4270431f8f.40.2026.11.18.04.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:25:37 -0800 (PST)
Message-ID: <0935c08b-828e-4a8f-95fc-04b82ab30fe7@bytesatwork.ch>
Date: Wed, 18 Nov 2026 13:25:35 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linus.walleij@linaro.org, brgl@kernel.org
Cc: linux-gpio@vger.kernel.org, mariagarcia7293@gmail.com
From: Guy Morand <guy.morand@bytesatwork.ch>
Subject: gpio: pca953x: TCA6418 support and driver design
Autocrypt: addr=guy.morand@bytesatwork.ch; keydata=
 xjMEYVrH0BYJKwYBBAHaRw8BAQdAoTOFJG+2Y+RQADup0trJWVq0txsRD9cwnFvJDOP972XN
 Jkd1eSBNb3JhbmQgPGd1eS5tb3JhbmRAYnl0ZXNhdHdvcmsuY2g+wosEExYIADMWIQRteh66
 gtptph+nQZni3NUZ5EzT5QUCYVrH0AIbAwULCQgHAgYVCAkKCwIFFgIDAQAACgkQ4tzVGeRM
 0+XCrAD/fcnTVlpmfLk44MXE155KhfZlGF2ohVATPa2AFC0khfAA/1Avp55HOzMVCY2iwwbx
 VJXFd/3lwrqp90zqH2ORd+cAzjgEYVrH0BIKKwYBBAGXVQEFAQEHQKyxw9Yob3k4YKr/6iRL
 es1udYw9k9Eb7HJHxeIoPhBjAwEIB8J4BBgWCAAgFiEEbXoeuoLabaYfp0GZ4tzVGeRM0+UF
 AmFax9ACGwwACgkQ4tzVGeRM0+U3ZwEAp3vzYVz8JtxGQ8Q+n3pTdR5TOwMdkbE6EBMCiE/s
 Y58A+gLI+AWyJ3L0V5rINV7FxBc0caP0OJskWOYyN0aN7R8P
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Linus, Bartosz, Maria,

We have been testing the TCA6418 support added to gpio-pca953x by the 
following patch:
https://lore.kernel.org/all/20250703205740.45385-3-mariagarcia7293@gmail.com/

On our board, using a 6.18-based NXP linux-imx kernel, the following 
command does not toggle the requested GPIO as expected:
gpioset -c /dev/gpiochip4 -t 10ms,10ms,0 0=0

While investigating, we found several issues in the TCA6418 support:
* The driver uses the PCA-style i2c auto-increment which is not 
documented in the TCA6418 datasheet, leading to corrupted registers.
* Input-status registers are not marked volatile, so reads can return 
stale cached values.
* The bulk get/set paths do not reverse the bit order of the first GPIO 
bank, so they can read or update the wrong line.
* Interrupt handling is incomplete: the generic IRQ path does not 
configure the TCA6418’s interrupt-enable and edge-selection registers or 
handle its status and acknowledgement registers.

I have spent some time trying to fix the integration, but the TCA6418 
seems to require several chip-specific operations.
Before this support was added, we used an out-of-tree TCA6418 driver 
that worked well for our use case.

I think the current support needs to be fixed, but I’m unsure whether it 
would be preferable to add the necessary chip-specific operations to 
gpio-pca953x or replace its TCA6418 support with a dedicated driver 
based on our existing one.

I’m not familiar with the subsystem’s design preferences. Which approach 
would you prefer?

If this could be useful, I can share our existing driver and the local 
fixes we have tried.

Best regards,

Guy Morand
-- 
bytesatwork
Technoparkstrasse 7
CH-8406 Winterthur
Switzerland

phone: +41 52 213 79 79
