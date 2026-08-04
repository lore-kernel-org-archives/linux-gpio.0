Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828FB3B2FFE
	for <linux-gpio@vger.kernel.org>; Tue,  4 Aug 2026 20:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785875474; cv=none; b=gyl5xtAAvZEAJxfB/PglJnGfnlFCMm9XezlYAVkodfp8vxQISE5XrfBFJ2AXzfujvTnbHQrA9f1WCaaYklCL2JtwgIZ4xm1N/g9rJJJxn2bWpQzb2AUL240sFuKU1hCb/CLM8bZ3qMhb6Q+b+jO6TZpQ+Hmf5sEnP1+8l5QRmA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785875474; c=relaxed/simple;
	bh=hQ/IF9zsRp6EfE4UNaPgSz8EQXYUIanVlGiQJgbb6as=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ikzIR7dQZZEmwj2lW41aq35W68WN9nQu3xKMXK+vuZ6GSIsmP8+7fPEFTJQ1V4cKUAAs5iQVVsIj0pRbF/RH/24vSpsW/JJB6vRDL+hbCu9CiVgjjmZ4M9aAqKNhy0flXahVZf3mc/4o7PJuz9RLaA/521xRfXSTzYvdHCzFMjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jdb5XWaT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jdb5XWaT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1848D1F00ACF
	for <linux-gpio@vger.kernel.org>; Tue,  4 Aug 2026 20:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785875473;
	bh=hQ/IF9zsRp6EfE4UNaPgSz8EQXYUIanVlGiQJgbb6as=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jdb5XWaTxkq+n6O53rvIAk3SysegMg1HmXJeeSTmoOmmG+x6wcMVbEpwCCvy0f3iG
	 cf5ZVHDJV+yM+UT5/XUOi5ROLw+pJlj6FS4pMpv/e0pMZOJdhh663bNVf6pSyeVQNJ
	 t4IHmveN0te3rwW8o1h97uK8SaWJOXyrvRWYWVPWipJBlu6S6q42vYrPrkZIgY8JH7
	 X2tYAd7TmK5eRbqeEhJBnsCH3Wh7sC89Fs0U7GG2vv/UfXSYFziwD5fIoDKZv8m35i
	 l23zB59keWG4A/xhAn5os0DKKvDukEtcneCEKJ5oasGR7yUc3s2qyan4NA8xrYp/ED
	 ZhNGOCmQ/hcog==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b021916bd3so329719e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 04 Aug 2026 13:31:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqcTcXCCAvTYreVbU68JqvBUr2NgbQZOM+I5aYZcnjtTYmzJ87WYI3AZ2Iffl7m67MdWlpEm9BUxJW/@vger.kernel.org
X-Gm-Message-State: AOJu0YxmFE6cTQasV+++Zjz/N5XeQieyXFvIPThyCRiFQKJP4btH3sxp
	u3hv2304gBx0JnswTQckIembI+uDqD3jNU/O14w7M4I21gzHS95ygJ8WFTjvNta1Lp55zrgd7ea
	tdoR+0QnQu08cDFRGrTXuuVispBYEkSM=
X-Received: by 2002:a05:6512:2342:b0:5b0:1760:fabe with SMTP id
 2adb3069b0e04-5b2f4b8bfe8mr161410e87.15.1785875471838; Tue, 04 Aug 2026
 13:31:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801072711.153217-1-changhuang.liang@starfivetech.com> <20260801072711.153217-5-changhuang.liang@starfivetech.com>
In-Reply-To: <20260801072711.153217-5-changhuang.liang@starfivetech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 4 Aug 2026 22:30:59 +0200
X-Gmail-Original-Message-ID: <CAD++jLmbuS-Tx82AZzwJZ=ANVwi3XVtYL3J4VYaE3yEZBumZ0Q@mail.gmail.com>
X-Gm-Features: AUfX_mxydusxf8VE7_hAS02smaZytShMdtSQeu6nrNbjybQ0dqWTUpDubwEFwtM
Message-ID: <CAD++jLmbuS-Tx82AZzwJZ=ANVwi3XVtYL3J4VYaE3yEZBumZ0Q@mail.gmail.com>
Subject: Re: [PATCH v4 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Changhuang,

On Sat, Aug 1, 2026 at 9:27=E2=80=AFAM Changhuang Liang
<changhuang.liang@starfivetech.com> wrote:

> Add pinctrl driver for StarFive JHB100 SoC System-0(sys0) pinctrl
> controller.
>
> Simultaneously add a generic pinctrl driver framework for registering
> the pinctrl of other domains (sys1, sys2, and so on) in the JHB100 SoC.
>
> Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
> Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
> Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

With Uwe's and Philipp's comments addressed this looks very nice.
I really like how you use all helper libraries in this driver!

Once DT bindings and comments are accepted, this can be merged.

Yours,
Linus Walleij
