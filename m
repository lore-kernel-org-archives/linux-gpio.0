Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3FC35E1CB
	for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2026 07:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783755270; cv=none; b=Clba8Uf2NFUxG6dhgHIqaLVvCMVEZDz1EGInl01kLXO3NxBGupD1lT9lZwrMqeimiDUlz0Ew3peAkub1GsdT09b3NiuJ3oO3O21Y5ttc0hz22484D/xyTQcrC48JF4ugpRQ/uiouQdoVCQLyGXzvSl+GJZX4V++yLgPqNniziBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783755270; c=relaxed/simple;
	bh=gUnPJvqa+6hCH/9HCtTO8STc6X6BWHZ70c5H6AKWsOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GalytsIwOyOy5xR/1nmyeTV74il1oe6TCS/FilFvegCRjlBLt8tPxVXsHdDnQko7mew8mgqGJG6dyMvGZM96SmPVW6MSglfaRrhmBxWihNbm3UzIWU2aF7kV/X2gHkzsIae2LtrPaEhoOGsFCtA5EfH0Du9Kk7PKNPBqz7uywcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AVUYdWB3; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AVUYdWB3"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aeb6d00883so1567785e87.1
        for <linux-gpio@vger.kernel.org>; Sat, 11 Jul 2026 00:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783755265; x=1784360065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aBafLctpeA1AoyzErbEa9EGgxzwRbfKFWoPKc6c7bv4=;
        b=AVUYdWB3WfvWD9/jCidP0U7zRkAI7QnX4kmNcHjB6Nosq4CWaZlW0hNhy2LM6kgpWe
         TWeOEWd21tnxJAl6DPVycHqgm9166I3BafNhzXVO9hS6LEulcv+AlPncKAl7GvVrR03Q
         iCvt2f7qMPGyswDv6RE6LdZAC8T7nBCACNeECjWvasy2/IQ6mcUH99GfG+odlxT5vxDc
         faI4NAbgRuPvGxueHmF2X4sAqU7TBPz2sj2hy41Y3HsZaAYU2w0jJYHYvY8gACqUio0A
         PKN2hjadzNTtEb4X+/A4fXYRXB4crD0SpHGqL5UMuZ2Is9WMaTouNVWbOrjTDz6nyty1
         dqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783755265; x=1784360065;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aBafLctpeA1AoyzErbEa9EGgxzwRbfKFWoPKc6c7bv4=;
        b=Zz/A7p/9HuTSTp+j26pj9dZQWwoVyLIxiSMJYD8FLC3NsCOhAkxZr5PckiLkfkH5y9
         3/l8VDJvs+xA30JKp9w/W/yqaWk0Dt7uuudZqE0QuysA9Q86dsxjKhAErOqksAe4RGLx
         S1XR9+od3snrktf0E002WzzkLhAYVKxHnZISgxK4n3d1wurG5328TWrw/B7GA/AVpFZY
         RdeGXcrZOeL1PD5cce3rcpo9254bnTXwtu/I1qc/NempgHXdRx9rbDMoGPjgcaBRA6qp
         /Wesv/N1/C7ZU9GFpSv5gdK5yHO18zr4bE9/7GzDq98efihZtiuuvVOJPt7Dg4eGzVtU
         YdAg==
X-Forwarded-Encrypted: i=1; AHgh+Rouw/jHjsB+I3nco7q63uO8Nhhm2RzXLotYVZg21lh3kY9BvxUS4fFERZtQWIYq6LEHxGcoPNmaPYxD@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp1Y/s0Lom8pAI+h8pHsMeuv/inMPOOV88yQ2HebEbDXTClBkJ
	GVglMchuqcB6T2+ZLwX06bCI0EzHGVPjJzxnwcdhdVpvhlqvZ1r+Dz60
X-Gm-Gg: AfdE7cla/fQwOM5rFRmLur2nforjP3hLEFK92kyi/gNrGDpU/AfXjM6WpHfz9XeNL6T
	hdoMB5WjjttMg9o0tAODGkEFwb8taIZDj0jjytN/it8xHTeZ5/koX/Hqm/NDoVCU++IMJ3dfxYs
	MsAIEun/Rw2ZQPRFKUsDmnDIXairs22YX8XxkguJg8/oRgWV/IKVwRlt3S74jCRNZb/5c8ksD8K
	aGj4SeWTHtzWhfLIGLs5L7flsBEsHx+eqNwKS/zwaNcMd1YJ9wzxJBK458oBfS9SAOovnfln2uO
	vc2jvl8Olgg00hwm6e9qJ3AS9TzaCP5vzAp2gsS6gHMNmLsTZWubF9bxzhFmdkmrb/0l/unYtQU
	WF0pDOfm8AV1j3zqdM9oqpNxQ5CQaC5B/ufevj+rgr3G3yM+Ur+Shr2axaF1TiHQqiLI8DCTv2G
	HAm3VGanH5vQzoDJ3vZyBvtDj0MJexDxPVETFT19pTJLVk/hs6KgXIH0ois6BQbQb2nW0esQ==
X-Received: by 2002:a05:6512:3f8:b0:5ae:bf45:e3be with SMTP id 2adb3069b0e04-5b0236689cdmr321070e87.21.1783755264967;
        Sat, 11 Jul 2026 00:34:24 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:4322:18e2:4e2b:60a6:4ce2:33fb? ([2a00:1fa0:4322:18e2:4e2b:60a6:4ce2:33fb])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca9dd41sm1117527e87.48.2026.07.11.00.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jul 2026 00:34:23 -0700 (PDT)
Message-ID: <de1d491e-159e-41c2-b145-4d09db091031@gmail.com>
Date: Sat, 11 Jul 2026 10:34:19 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/10] ASoC: replace linux/gpio.h inclusions
To: Arnd Bergmann <arnd@kernel.org>, linux-gpio@vger.kernel.org,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Krzysztof Kozlowski <krzk@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-input@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260710211954.1373336-1-arnd@kernel.org>
 <20260710211954.1373336-7-arnd@kernel.org>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260710211954.1373336-7-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/11/26 12:19 AM, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> linux/gpio.h is going away,s o use linux/gpio/consumer.h instead.

   s/s o/ so/?

> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>[...]

MBR, Sergey

