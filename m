Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F26C1A680B
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 13:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070719; cv=none; b=nE79R8ck37bmw/CxjEQBXjS5IWWLbF4XGarT5LdUjCUcoeQbgSurPo8h/MNqMv8IRM+zuNFn0gkN2vaxCC0Z+/CsB8R83lHwnJL4xjtieycFCOVsp7vXfoivtMfJA2acKFnXNLDz32Ft+p6n+TM/6dM96w4DVaAu2q/HK1xo43c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070719; c=relaxed/simple;
	bh=H3zCP5H13vvVFVkfSQiIjCtmW1MwjHaJtfgXUw5dX60=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=i8CmENohVB67GC0q3KALvmlpQo/ib1cQ2lBIPWOlFloMTLHy18JrNc8qG7JT/3vl8LQnR+th11KCYN47DFWnIPP1jDc8+eWDrZstv8GrwlZC0shm0yz99iuRGcqmFzT7WfSvOOqoL+xdHBMmxixN4SeKK3Lwt7vfwXupCI7P0Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBae+0GZ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBae+0GZ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48afe75f055so433787f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 06:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792070716; x=1792675516; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0fatwg6Ql10eF4yUkxnXRufoS1VKiolsiumheXDiVcQ=;
        b=CBae+0GZcOGJDgIX1tHi1ZOI04z/UBOJD39qMdwmRbrcq971OYnfa8TT8VgnRoH1ag
         OJqediBSk9PNcNxf82i4Uk7Zra5yHVcpOMB9B2+FzQ0UgYNkiRTKX+9nNikkJPS0/UAk
         JpBHp1SArlEB3B/2jjkhESnhoeXzz/Gu5MIplCvBguZV0WTQbb7OTA55xNB2ax8oQQaU
         mYOm1payuMenxSFnlQNKDiSfKGsV0u0lKAO1Kklmro69gOhrjc+8LNS+0z+ox/TwvVJr
         p2uvpktUHsQ+QpxC+NCvrNykld46qcz/pOkoi7G9l9iZo+xbvmnbmYWO1BJnuV9Bb6Uo
         FlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792070716; x=1792675516;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0fatwg6Ql10eF4yUkxnXRufoS1VKiolsiumheXDiVcQ=;
        b=GUVuQN6Uy7UHKWc1bL2Jj2NtoCE8dAVLvreAFOP8JjAFKaTJ8TQyxHKW32//JBEnOC
         h9whY14jjpiP3i3XxcYspezAbTT10u2sDfFYhp4N889AqkuUvTR2zkQnBSbBFXq1w7QB
         YCLyL8YvvOR7CsCvUpha1egpoYO8BgODyw6HLX2wohVfj8yPXS0TcLZiGmCcKF32e6q3
         OAFdOXGxmSyNjA7GGUr7JQenFTkdYwljL6rS2OAA0+a6SxEvc2WipKCuDTNKal2kM1BT
         A0xmfjijdSQD9oiDB5+KGbvnDzBnj4mINBgvhXJig1i7roEXTJeeRZ0iv54qkgWv+q7V
         I/iQ==
X-Forwarded-Encrypted: i=1; AKwUvByFtwLvZC1FqWrlmrhNoWW33weioPxM1ovHUwQ9eILkeSMmpcwLjAY5Oon6E2499vWtNMB2MB7+TfLq@vger.kernel.org
X-Gm-Message-State: AFq9FYKjM5zLF6JVLOdn3KnqlpUX60mwQ/VOPbfUouJRjRWqUC2MXf6p
	cms6+5kFO/A/TDO8grbVzg6qxEopmdKs2Hyl+AqSzSUHAn/gNl+MU8Q6
X-Gm-Gg: AYBFou3U/nXlmMwyc6J/SD80UguKUT+lPtpcVsylwrOV5SyMulSOqxU/lLI0ssbKqKL
	AeTBtu3Z8jtlRyh7PI0xM8QTvolqXdG3dF5wy41TrGXL5d01PIdw8sa8jkFLAqRaux6ZfrthnvO
	cm/nCnTWiv0guEeEAtDSbsNIgqz5pskwUNH3fkauI346ak2E1w0OwVcbhYKA1Wuxs4AwJQbI3UT
	mmk7AaGYR5jbnhwgtKHIxwWzqlJ1qPQIxnchdD2ghIUq2bjd9BqEO/wyCSBb25OZELMzexEiiTO
	rBnLkUoQ0N2b3CP2pJorH/JIgZBdHQ2LUOB8VeNu/QP0KRyo34MSLNrUHPU5y/86ba0okO6xavR
	IywvrYcH6E/GJef0/41+cD1Bw1OjWrJU6GV40TO+irkUbvH+IZb6ckrvnkC0W7DBIYYewD2OORQ
	IVq+VzmP2ciGgV/RxSpd1vNAa3RgpjxETz0p8Gf2Nat71vDpgzVvYqCCe5TCy6FKH77ES/Ymh4C
	5NTDPoH0X5yskB0wecnM8yV5okaB/r0uasJCCINaXdyiI88tZlBU18iaA==
X-Received: by 2002:a05:6000:4549:b0:48d:facb:5939 with SMTP id ffacd0b85a97d-48dfacb5b8fmr147377f8f.8.1792070715607;
        Thu, 15 Oct 2026 06:25:15 -0700 (PDT)
Received: from [127.0.1.1] (ip-024-215.users.dtel.ru. [91.210.24.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de09693c7sm23470807f8f.4.2026.10.15.06.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:25:15 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>,
 Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 02/11] irqchip: Add Cortina Systems CS75xx peripheral
 interrupt controller
In-Reply-To: <87tsmndu0p.ffs@fw13>
References: <20261013-b4-cs75xx-s2-v3-0-181bb0d23f4c@gmail.com>
 <20261013-b4-cs75xx-s2-v3-2-181bb0d23f4c@gmail.com> <87tsmndu0p.ffs@fw13>
Date: Thu, 15 Oct 2026 16:25:06 +0300
Message-ID: <179207070645.418589.10399440167204506807@gmail.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

On Thu, Oct 15 2026 at 14:32, Thomas Gleixner wrote:
> On Tue, Oct 13 2026 at 09:07, Fil Dunsky via B4 Relay wrote:
>> +static int __init cs75xx_intc_init(struct device_node *np,
>> +				   struct device_node *parent)
>
> No line break required. You have 100 characters. Please fix that all
> over the place.

Done for the next version, the declaration and the calls in the init
function are on one or two lines now.

> Other than that this looks good.

Thanks for the review. The next version will come after v7.4-rc1, with
the interrupt controller as a series of its own (binding and driver),
split from the GPIO, I2C and watchdog patches.

Fil

