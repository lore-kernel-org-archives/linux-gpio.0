Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D85547D444
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 12:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251592; cv=none; b=ofUpVequpSiwAzMBm40JmWS4vFc1Dm9Blc1j0/Aw00yqmNShGzR8pYti55v90/GwkrlKbe4nVO3mDfHIFRaxuk7k6xDHfLYtMIdf76T/wOElm6MG1BG6jOFIkd5baQDlCMLX39tbOHh9CVjnLK1uUPRxZjwMAtcB4ZKKDEShPlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251592; c=relaxed/simple;
	bh=AMda9b2M0HE7bDg1/E+8Yg0zmUKaV5CLAKi97xEwv68=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sSp2/JbZtzLe8h20I2P4AF0Pn9tYtGiNk5KWO3NeNceJfNn55FrLQHw1jgxjsrTQrzOJ6xoHJ6oy4aneQkfrnEDqPU8DGJnltn9nBFAdVuo+iXQjYkX44ec06IfWAg4Td3CY/9yEAU7O9m1Fgoq4FikqU2cNr6SUeHs5kOp0+gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AN2eipIw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AN2eipIw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 120B21F008A0
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 12:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790251591;
	bh=AMda9b2M0HE7bDg1/E+8Yg0zmUKaV5CLAKi97xEwv68=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=AN2eipIwmtVZ4M5Ny3OwliN67dMXjEm7YmJn4+ad6DexfVZp3CDJtiYnaoFksqodn
	 mwZ1b4SVH63NPUXV2EYeIbJRRnrYEqDgJ1aM+hTpYkpLxQ5NV73qb7D1u2ByBnsLeP
	 Zl/DJDHTqT6OiaH1vubVrlpERsPaD3Mgx1WPdPuV2fXw3E7nHMRQJbcEbRckmRj7yG
	 gAfxCXLubigONN5I0PrBpD2HatKrJBxPWMsz/eb3BPSEVakQ0QFCs7J7hyRnjtVFT/
	 4LqPzByO1QeWXrKGOuxdQ7j+UV3m6HYuvu8nlQbIgjj6b8xSrvdI9ggm13W8104LNs
	 lIZXxp6e0q25g==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c7a1aeecso1696067e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 05:06:30 -0700 (PDT)
X-Gm-Message-State: AFuF++mXFMcpSygq+z+SFI39rp9V3v1LMnTwFWqiOc9mqfyk0GNntUT5
	lQROmKLZQTlJG+leWhANPP/Ap1uWqJfYny+Sd4+xM7DcotSyfHcqC6Igk/odubyD7FH4WLuKyhH
	xY95lu2TmfO60P/oyk8QHNKWOBmG/sU8fS3z8oeWUfw==
X-Received: by 2002:a05:6512:1192:b0:5b6:423:9fa7 with SMTP id
 2adb3069b0e04-5b8df1f3ec5mr826739e87.31.1790251589716; Thu, 24 Sep 2026
 05:06:29 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 05:06:28 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 05:06:28 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260921-axiado-ax3000-sgpio-controller-v4-0-79c444be7faf@axiado.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-axiado-ax3000-sgpio-controller-v4-0-79c444be7faf@axiado.com>
Date: Thu, 24 Sep 2026 05:06:28 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mdx6zH16Ej-7EDVw0cKix7+h2tOxSL8pc1PiXhptA_R-A@mail.gmail.com>
X-Gm-Features: AclHuK_9ekJ2IaIbciUj6wKN51mS4Pn8kPTOGKYEK1UcTaHgO2MIe0OH-x_Yx30
Message-ID: <CAMRc=Mdx6zH16Ej-7EDVw0cKix7+h2tOxSL8pc1PiXhptA_R-A@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] gpio: Add support for Axiado AX3005 SGPIO controller
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, Conor Dooley <conor.dooley@microchip.com>, 
	Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, SriNavmani A <srinavmani@axiado.com>, 
	Karthikeyan Mitran <kmitran@axiado.com>, Michael Walle <mwalle@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sep 2026 09:20:21 +0200, Petar Stepanovic
<pstepanovic@axiado.com> said:
> Each SGPIO position provides one input GPIO and one output GPIO with
> fixed directions, along with interrupt support for input GPIOs.
>
> This series adds support for the SGPIO controller found on the Axiado
> AX3005 SoC.
>
> The series includes:
> - Devicetree binding documentation
> - GPIO driver implementation
>
> The driver uses gpio-regmap for GPIO operations and provides
> controller-specific interrupt handling.
>
> Tested on Axiado AX3005 platforms.
>

The series looks good to me so if there are no objections I'll queue it for
v7.4 in the next days.

Bart
