Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB35D3B8D76;
	Thu, 15 Oct 2026 14:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074751; cv=none; b=jDQ8vyupXPhOTFQGWCFNYyN7bZGCiT8pBgftppaMe2N+a3/HDCc3xc1O+5iq3dPDXzzBw5f/CERJD+PVeeVbnn9dcaA1T4HLh0c+Mz/ajahKXCpqlgRRz3GrdAK/jryPSgI9LJT6yhgmY21T4RmgI1hX68NlOnGnLXm0/TfAxC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074751; c=relaxed/simple;
	bh=HlGHbFyOJ00aXgej0AXTIOlXuVVpstIzy1FD4dmN1aI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=pvBH0JFR6o3Aoe0rv3h6sHZiY7UofznJw2qagl+KtOS1yQdTfP6V79OGe66nUdb3eQ0r+1njhjwSUMvHDzi5398rte85BwYAaiYApvzSTAar360RiLODbX/WM+T/AtA7Xi5Bnuc/UFhKuwg5+QvZxeckpAzvfuSqb07nOxdIg7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cx+ZQiDB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cx+ZQiDB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E49C41F000C5;
	Thu, 15 Oct 2026 14:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792074747;
	bh=nT8SqANTqWiGWPtydEkIGllJz7J68xmMsDf5Aer6c5M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cx+ZQiDBagj4sZOU/oRsvbwxJhaHkQckiXpKuYkgoUJXO2bsW82xYbqWFH4MULf2a
	 zxvD68osE149fRULMBu8vgBhy+Xz1nlg02gC+H6/sAN3PzdwFOThyFfKDUy3/GUH1T
	 GI1ZXMd2syjf8IpUqcL05+e/EryeKJDpnc2EHTNhnmU5O2hL0pnhVz4GFtJtdAIQpq
	 3w1zbP1exy0r7mvLRVNcBg/TwgYjGLqG1NOJJ+tmg0YOg8TRAMTV1IYtZMJuOYdpYc
	 MoSZZE1g5PTOXwtEgwR/k4LnzuwDZ0+g1gZ4gJ1RD03oHUocQEfXlYgnVi8F7pN21t
	 oT+xZjXSCquPw==
Message-ID: <sashiko-outbox-172963@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: pinctrl: qcom,tlmm-common: Add
 wakeup-enable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-tlmm_wakeup_gpio_support-v1-1-c6d6f37a7e51@oss.qualcomm.com>
References: <20261015-tlmm_wakeup_gpio_support-v1-0-c6d6f37a7e51@oss.qualcomm.com>
 <20261015-tlmm_wakeup_gpio_support-v1-1-c6d6f37a7e51@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 14:32:26 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: custom property wakeup-enable lacks vendor prefix
--

commit 1b3617dbc4a7e1c4b006d9d99d89f2ff25a551bc
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

dt-bindings: pinctrl: qcom,tlmm-common: Add wakeup-enable

The TLMM can gate whether a toggle of a pad is transferred to the wake up
controller (PDC/MPM) while the system is in a low power mode. This commit
adds a pin configuration property so a pin can be armed from its own pin
configuration without being turned into a GPIO.

> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.y=
aml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
> index aec72e8c06214..95f5396116916 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
> @@ -87,6 +87,18 @@ $defs:
>        output-high: true
>        output-low: true
> =20
> +      wakeup-enable:

[Severity: Low]
Does this hardware-specific property need a vendor prefix?

Since this controls Qualcomm's specific interaction with the PDC/MPM wakeup
controllers, defining it without a qcom, prefix risks namespace collisions
if the pinctrl subsystem later standardizes a generic wakeup-enable property
with different constraints.

If this is intended to be a generic capability, shouldn't it be added to the
core pincfg-node.yaml bindings instead?

> +        type: boolean
> +        description:
> +          Allow a toggle of the specified pins to be transferred to the =
wake up
> +          controller while the system is in a low power mode. The driver=
 arms
> +          this on its own for pins requested as GPIO interrupts, so it i=
s only
> +          needed for pins that stay muxed to a peripheral function and a=
re
> +          toggled by an external device to request a wake up, such as a
> +          SoundWire data line driven by a codec while the bus is clock s=
topped.
> +          Only supported on pins that are marked as wakeup capable by the
> +          hardware.
> +
>      allOf:
>        - $ref: pincfg-node.yaml#
>        - $ref: pinmux-node.yaml#

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-tlmm_wakeu=
p_gpio_support-v1-0-c6d6f37a7e51@oss.qualcomm.com?part=3D1
