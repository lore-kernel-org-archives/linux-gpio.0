Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F69D2FF66A
	for <linux-gpio@vger.kernel.org>; Sun,  9 Aug 2026 16:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786292655; cv=none; b=iPPqBFtBQnzOJJ2n6kOixJZzuEaE7FlMO0MCLm5t+m7kFMbhoFmrkKPWPZPWEJi6LR8R7g+LjMzVRJEhetfmO61sXaTgfjCix7ZLtukrOofwBPUogxO0vHGnWVeVlwbAOtTDjasENV8azb/vV0damqP7Qs/7Mxk80MuSX+13CB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786292655; c=relaxed/simple;
	bh=L8jVhzcEx/1Ri/TiJ6hXDYJPVTTnzDVvCCZJTFtQQNw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=hW4ItO5hkEXEIGVqOnJYh5UgE2MejHDVHtVy7QQ8HTLmfEt8TxOUItd1MJiW/nLc3BcoZEOMkzAkXiJ+EQHE9LVRXBPrNcFd5iXqDBRrvcvoy8bkNut0GSuaWNOI4D67m6a0Nv1kX30C5NY/x0Hnv/XOboZ6CBK49yK64C5pKF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R00Blv2j; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R00Blv2j"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5c39cb2115cso2572535e0c.1
        for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2026 09:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786292653; x=1786897453; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L8jVhzcEx/1Ri/TiJ6hXDYJPVTTnzDVvCCZJTFtQQNw=;
        b=R00Blv2jCyJ1JHvOuRWxIirbnXSieJQnaFuU2qIecCIGssL2OXmby9NhkIpXoGkRHv
         V4nUCAP/zl9IUOas4zwgcMDvP73s5uLLWL6rdtod7P/3TKnxcEkEAG7HVcy9ycyioDOt
         gAApCeEgS8qZ81mk1iFxSACvDPGQ/eTM2qtA3l/Wz8iTnzo18Vi6Dwz7XCWdC9g+j7QV
         ClZVK+56rnmJ8HyMwTURBkICw4WGXy6U7u8Jk9R3iaTg5JmtLFu2HoxT/TM0XfDHTz8R
         TuBoUkQrcEsJYQUH2Sn9miCwmkUGudqDOELVw1UaQk+hJZKMZdilOMaZH7EChD+xLJ5J
         5KGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786292653; x=1786897453;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L8jVhzcEx/1Ri/TiJ6hXDYJPVTTnzDVvCCZJTFtQQNw=;
        b=UYzA7Je8GBrK8HesH7duamHc55SfifwKmrjMoDZAhc1UzcyVHTIvhzwND+vKnrIWce
         MjejGt5QA8XSmQjG0K5YshxwoVzstV1rs7niR4dcNj9jynxtzXALAfbfnydScX7gm8j0
         CPl8b5hlmXK7j84PtspMjHmyi5JvlH9+r9KvhkB/uiUC6F8UTZ3iohH9WUIPjhbu1Ss1
         W/8Rt0B+7dyeW0XbN0WSVkZFAhFLn69Jlmi9spj+A6JBSCBHzjr8GtDDCrF4dEt+j6g2
         OmGYIQezud9dVogOT+mF17sTix3h+ymPkzkqqH3JFzhpfUaTx54XmXzQ/dozV/FJqmNb
         u3zA==
X-Forwarded-Encrypted: i=1; AHgh+Rph7fBIHSpQrXCbURCDYksVt7vqA1hbydEoJimBLXMWZ1ju0b3aV8pgJz77WDVFv1aCRIDrSJiydWti@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4GusV+5l6WoTJ+8JpgnP1VOX4on4gKssipjCFX2hl1jQLCS2l
	MLJQ6KyAGSo8tMXPhNkIRz0aFNfg6kSUlDrAFmI2szkNci21O+HkE+kx
X-Gm-Gg: AR+sD11beve65q2NuTyshQpL84KA5hLAX3sLHaERu0NKx31UJFp1OLLM/kiumdH7p76
	t/vcTw+SCs/zKwqQOKKxDn8B5NwMLLe//o4NTT/cwLqc7NUDcegSBlne5V6f/VH4IrG3GMsTrSt
	jRUmYVtX16QQhnWqepe5L7B1AUd7FUvEXR4db1jK6W1RRuLplhrhopQttf/xqUMyHw2moT5J8+c
	Ohh6iaQyvCCcna+DNuZHy0Ra9Shcu7KNppKAb/1p1HQWSjO8Un60bw6Z2u4u8PwC62yIXUL4obP
	95BiWO0YuSgAlLsrnzQ4+HulMXlt1tfDc9TMuX7QOlmejUeZKpvXW2giVZSOQ0RmpZVuqR014LK
	fWq2pNviZHHrcePtyKoxQoQH8jHEWpHrexB50dMZHB9iXNqYqNyF+7wxhMNcLyZf5P9uHzno9XR
	R8f/PGfnD1NXi/EVK28XnM4IA0QPM1QrEpaZLOdbhRmCANfnHF0fc=
X-Received: by 2002:a05:6122:2385:b0:5c2:c79c:c093 with SMTP id 71dfb90a1353d-5c4152d5cf1mr1326569e0c.5.1786292652899;
        Sun, 09 Aug 2026 09:24:12 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c4133821e5sm2592233e0c.18.2026.08.09.09.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 09:24:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 09 Aug 2026 11:24:05 -0500
Message-Id: <DKKJW8KLSTON.18355X0IQHY5C@gmail.com>
From: "Kurt Borja" <kuurtb@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, "Kurt
 Borja" <kuurtb@gmail.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Linus Walleij" <linusw@kernel.org>, "Bartosz
 Golaszewski" <brgl@kernel.org>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 2/9] iio: adc: add the ti-ads1262 driver
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <20260807-ads126x-v3-2-f89925d72792@gmail.com> <anetMEd_kLs1YXwu@monoceros>
In-Reply-To: <anetMEd_kLs1YXwu@monoceros>

On Sat Aug 8, 2026 at 5:28 PM -05, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>
> On Fri, Aug 07, 2026 at 10:58:24PM -0500, Kurt Borja wrote:
>> +#include <linux/mod_devicetable.h>
>> [...]
>> +#include <linux/spi/spi.h>
>
> Please rely on <linux/spi/spi.h> to provide the structs of_device_id and
> spi_device_id and drop <linux/mod_devicetable.h>.
> <linux/mod_devicetable.h> is planned to go away soon.

Thanks for the heads up!

--=20
Thanks,
 ~ Kurt
