Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869219;
	b=MZqZIL7OdTSRPXnAfmJMrx6E6AXjZKbiQRlFw2mm+rh6P+1aG2u93CFuHHAxBDGAXK3F
	 cJSHAKsiyplt00zFOpIfxZTZFU5UNvVSo1pdFaI5o6/iwWgnw9gq16cskjnPImK5LFXn3
	 tC9SBtDddVt+/MpVsktFQqkhRESffQA8BAg9Q9xUoT0OThAlP6IPe9RrZO+b6I2kMTsAe
	 S6Gdgg/97VhZnea7V2JGQLVvFY9pVylp6mbRntdmF0e1vKls53zc3DmJoviQvc0H1GBuK
	 /pwWCnPPeWDL2mA2mZm03VNU1eVh3jHFIeomBu5n78J4Vh5pWY1RUVOoMbbf4zVpyAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869219;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YqTURWp9PvTyxGu1fA7UPesF008QtJYvc2+tDpUslUA=;
	b=gQFg8v7I+2VtsIouwWbL2ximkpd4Uc+vuKh9UxjxrzTdH6G9Db7+uZuY7FImPCRdqkGi
	 gc5V5NTsnRqxv3v2CcO48VEGds9PTXwOOK/Fqx6XJ5p6fN88JSaSX4lRqnjDmgZt8NWk+
	 kg8crolaDZFEBxMPIgetlsyYL6Ps6zn+XXAiyRwTWuFoKtaVk8gz3H3rw4O+I8V4mZHjX
	 Ut2+4ULKKnRkf5lQSxwYY8aVbku4wJ8+CXrniaFOA1pesbwJBqW8QBVSDb18ynWLdEqM5
	 k+BR1cP6NqUhptW5SoWY94N90PyWOdb2DDUP0x2w1MKKEmtTgwEPBaHzg+4jLf3BgPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eFAX7Cmb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E25606A329
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 09:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eFAX7Cmb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87EB31F00A15
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 09:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793869218;
	bh=YqTURWp9PvTyxGu1fA7UPesF008QtJYvc2+tDpUslUA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eFAX7CmbVcJTCR7cmrQRUy27hNZRrDVMH3pzJmFViDG4/vWRHSa/6/NRAxeQJyJmn
	 2Jz9WrRDM7jQCj/nKbAMP47Jrqw0T6uqJdLi8vHAms14y+iZ4BUSx+ZQv0gbwCzkV9
	 vgJK9Sai2rvG+ASRoMokgAbVH9S77u084Jl5e/F4fMxNMWRivPezO+SrY+8ESkE048
	 2/MqsLiUZg0iFdQY+TmHJDp1wNKiN+0YWxzYIOdqwJQ7L2UP3snyOjYfUsxYq95vTK
	 qDsWxS1cmMBcQ06Ff4/bFInxMKTqaDreVNDP2aatjafPA4wbn0+Sb4QX4Hd1WnjKKt
	 ek1pRkU6OTE6w==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so1716705e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 01:00:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByQSj8PwJJjSaHAjQ5yV16txB9GMD2+EeE+IJvgNLKLo668MxN7dbRVeUueA9nFgM3jYaA+Z6DDE1i2@vger.kernel.org
X-Gm-Message-State: APuU4Z8k45oLfWl69oKd53b41J0D9H04Nz8PkcYT3PawPIF2st1vv9hE
	vjjbd7lkSZ5FCrJW+zF528FWyn8FHvjGNL4YUUIwxsCOontpIKfcUBYzVFSQ1R2MzafTviCOqvq
	EGz7wu+/cSfuU+8wsSa4fNC3zd1gXb9M=
X-Received: by 2002:a05:6512:1051:b0:5bf:ce1f:674d with SMTP id
 2adb3069b0e04-5bfd9560871mr6447073e87.15.1793869217354; Thu, 05 Nov 2026
 01:00:17 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-gpioctl-v2-0-1660aa3dbe5b@oss.qualcomm.com>
In-Reply-To: <20261103-gpioctl-v2-0-1660aa3dbe5b@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 10:00:05 +0100
X-Gmail-Original-Message-ID: <CAD++jLm2-jXDruk+odqM3qz+VgpSo9ECptCiX6_7q6xaVgu=mA@mail.gmail.com>
X-Gm-Features: AclHuK9Ew4bVhX9kBBvAur5XsQGaUYYntyqvGBWsbE9bPaSgjq-0z-BYT3JEdMg
Message-ID: <CAD++jLm2-jXDruk+odqM3qz+VgpSo9ECptCiX6_7q6xaVgu=mA@mail.gmail.com>
Subject: Re: [PATCH libgpiod v2 0/4] tools: new tool - gpioctl
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Vincent Fazio <vfazio@xes-inc.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-gpio@vger.kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 3:17=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Provide gpioctl, a new command-line tool for persistent GPIO line control=
.
> Unlike gpioget and gpioset which release lines on exit, gpioctl holds
> requested lines in a background daemon so their state survives across
> multiple client invocations.
>
> Before adding the new program: move some code we'll reuse out of gpioset
> and gpiomon and into tools-common.
>
> This is a v2 of the RFC I sent before. It's been quite heavily reworked,
> the details are in the changelog below.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

The series:
Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
