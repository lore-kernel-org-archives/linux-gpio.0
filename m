Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502676;
	b=v8hy9gZMS04L7cLM2Iuno0oZq2R+rYTNMwB7lgWTZcM4z3b1hg5Z+KeJ4bCsE3LKdy3Z
	 xQA9nsJsngmVlKcc2fYtaDGcLSznxpVafYVhfTt/ieeWk1IQx5AxxFSeFc4sHLM9BV0uG
	 zXU5Had512ueOU4+spG/yDlCz97c+iC/F9uwKBdzNrY6TMR6BCCc5sy0S7fxNP8nABUHo
	 fHJ4VP4aq5HtcGi6jd05nhijiWzdCR1wkHTeh65GiFZ9rFKlsjsvJdzm4pcNtRCjoMkCg
	 SZtuxmgi6K1tOAu2eYxX/VHrazc6fRT22dPyKs0R1bp+hPDn8xC4TJnC8f2EYykRxew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502676;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=COWPlZdRueN7pSY6pOWaLdT4Jys7uGpWmTmqPkHcMl8=;
	b=jVYhtNqsRK5/ih4eIKi6xE7s0JoNhkAejRqSYTSl/ErehN7+E3xDS060hf46JgN5ibFV
	 R5tf/evjRkEcgE5wMDLYfurw4VpBAw9daewpG4CNC6irtuwa3uQ+kgJOSUDjhMZAzfl+T
	 KA6kGb0o4z0HBFk6hbfTuxRCAODEUHyo6mNegPpdeQflWIM7wOudLVQlIGEQ5K8frfeWj
	 skfLIToqdPbG4VRuZrXTfe7sll9nTNcxN0WIG3FRy6Ub7w+xKDvyP+re65/g2HFUTW1as
	 0IUQlM+tSzomA1Vyh/t1i5YfhAOuOnhxppk7N/aXPs6GS51sdwn2PAHZqMRkrf8mMiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PmEXTee3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08670606A31D
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PmEXTee3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 959B41F000C4
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792502675;
	bh=COWPlZdRueN7pSY6pOWaLdT4Jys7uGpWmTmqPkHcMl8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=PmEXTee3Pb1/Z2oHDK9VdfnvCM4Ux1PZEFvf8G7QLnqQLAgFCDKb2xcoijp+hqKzL
	 o5CSN3VuG7XuaQUgKnXm6CHAzH16T/4cqXRSG5ZF80eXFkch5OaCwuDIQ3N6HOuZP+
	 5RP2iflcCjL8T5WmD4RP2zZ9SUCfTbNEJ6Exjj+kLGPIvJmwzFX6Dicy1kx6px4ctK
	 pEIiwLxlr2czPJg5c1S+oJ2yY3yX8wOoNBKc0ly8amOeVEF7w+whT5p4NsfJQ9Ec4z
	 RsvTj3+w6iYxxmVwFKKNpTixzeE1sR2whQocKWE6HJ8EY/koowwyafEAFo4Aj43wos
	 bY0qoENVV78HQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ab4354db11so13059281fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 06:24:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwSvn7FD0E8w79nl8o/a5DVV1t8GrevjKabOqR0BkaBMk8J+alG0QtzpTpZBJab/ODp9SgHMFMg8M/j@vger.kernel.org
X-Gm-Message-State: AFq9FYIpog+tqjO7Es6AsJj3nGz+/iG6+h2KAd8yWhtxtRTj2APhivc7
	37eLvh1Zh0VO4s/cg4Et732LO+Jq5bssUHr19Ok10kQO+lLMF5j1ve+m4jHNrTGRSJD2PvTXXQh
	ptzLFsV00SirOtZw6iN+JRt7p2+nmpf3Z1IsVYocffg==
X-Received: by 2002:a05:651c:2108:b0:3ab:4412:354b with SMTP id
 38308e7fff4ca-3ab44123804mr14301701fa.1.1792502674348; Tue, 20 Oct 2026
 06:24:34 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 09:24:31 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 09:24:31 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <cde9d00a-bfe4-4093-b03d-f76a122e4ded@baylibre.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009-iio-adc-ti-ads112c14-gpio-v2-0-3231a795fa63@baylibre.com>
 <20261009-iio-adc-ti-ads112c14-gpio-v2-2-3231a795fa63@baylibre.com>
 <CAMRc=Mfn7+uQYvLjGLxU9wMOnRwx5pyPgaLp6oNx+ZcFXyXL=A@mail.gmail.com> <cde9d00a-bfe4-4093-b03d-f76a122e4ded@baylibre.com>
Date: Tue, 20 Oct 2026 09:24:31 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mfu6moWg6bomoPHqgR=7F9QoPVy62Za_EegP3eb8+jctQ@mail.gmail.com>
X-Gm-Features: AclHuK_UJ2IGCUSDhuuXQjxJ1GUIk0fxrp4qAJiEjRQoj2s0LGafMJ4oqarMM3M
Message-ID: <CAMRc=Mfu6moWg6bomoPHqgR=7F9QoPVy62Za_EegP3eb8+jctQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] iio: adc: ti-ads112c14: add gpio support
To: David Lechner <dlechner@baylibre.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Chris Hall <c-hall@ti.com>, 
	Patrick Edwards <pedwards@ti.com>, Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Oct 2026 15:46:30 +0200, David Lechner <dlechner@baylibre.com> said:
> On 10/10/26 4:00 AM, Bartosz Golaszewski wrote:
>> On Sat, 10 Oct 2026 01:25:52 +0200, "David Lechner (TI)"
>> <dlechner@baylibre.com> said:
>>> Add support for using the AIN4/GPIO0 to AIN7/GPIO3 pins as GPIOs when
>>> the gpio-controller property is present.
>>>
>
> ...
>
>>> @@ -2574,6 +2726,12 @@ static int ads112c14_probe(struct i2c_client *client)
>>>  	if (ret)
>>>  		return ret;
>>>
>>> +	if (device_property_read_bool(dev, "gpio-controller")) {
>>
>> I think the right one to use is device_property_present().
>
> I thought this was the one case where device_property_read_bool() is
> actually correct because gpio-controller property is a
> /schemas/types.yaml#/definitions/flag.
>
> Otherwise, we should just remove device_property_read_bool() from the tree
> because there would never be a reason to use it.
>
> My understanding is we should use device_property_present() for non-boolean
> properties when we want to know if it is present or not before reading the
> value of it.
>

Right, I remembered seeing commits from Rob Herring changing read_bool() to
present() but it's like so:

commit a570feff16bd4fdaa247b4ef13f4d28f8c73903b
Author: Rob Herring (Arm) <robh@kernel.org>
Date:   Mon Nov 4 13:06:49 2024 -0600

    interconnect: Use of_property_present() for non-boolean properties

    The use of of_property_read_bool() for non-boolean properties is
    deprecated in favor of of_property_present() when testing for property
    presence.

    Signed-off-by: "Rob Herring (Arm)" <robh@kernel.org>
    Link: https://lore.kernel.org/r/20241104190650.275278-1-robh@kernel.org
    Signed-off-by: Georgi Djakov <djakov@kernel.org>

So only for non-boolean properties. You're right.

Bart
