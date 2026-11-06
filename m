Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952646;
	b=LGk2VTliG1cc6W2jCKaGfkqqrZn5b3Z1Asu4ARcGvMPlLqImm2LHHJiHgT54OvcFPleu
	 6Grl59M6NoDbRiyl8t5e0Cd/Afjvto/72jbebSHHxOsQ6qVmrZw3YYQi+39hpddVo08yQ
	 vNzN4CexcIyXYde1BC7IzyqomWiivpE3EODZxkhlShBVt4k0z/elMjzZQZ2Jvh8HmgQVB
	 MA2r6Tfsj3KjbEbj08P5pLetjhEKj9h7QHbBThFbduxxbAJEvl1QsbsE2VP6ZCsIERu+9
	 mUJqXL8g+vsfbCbq5AoFL5LbTYYaQkPhmHpL5VO85mv+hWdfOUeiYn21Npejyb9sfIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952646;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HACeClcT7h9LorXCovTw1HzucA+TfNbDbeRqmPZg37U=;
	b=knBDdiLlCpIfnNHlaoU5nabA2SozfmPYfz5RDaTTrYeEX2Xp9OHIRD2bwcP1F3eH5qxo
	 URydl4tUlWUYBoInIIQauSYitf9plfoGe8jjSHXbvPgCzXR43xpZz+SPSpt+B1NpSXuaJ
	 nJ9mqDbmmhJliPVhvJhk0tF5a+2+HBbQrxUM+eQJyAL0PCQmG/Hu+Fd+cE6tGSjkPObL9
	 ZHrdLFVcoz/Z98sjmixE76cY7pOaaHnQpP7+q9M6ikRpt7wmNzw3SV2gaS1mVVVWb8W8G
	 HCHuo+h2hGGpzpZI1TiKNVBBThVylBlYnnGf+bmvtXNISPdOWblKJJjww74B+VSwL1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Emnr0l/5";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D558606A328;
	Fri,  6 Nov 2026 08:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Emnr0l/5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF7C1F0089F;
	Fri,  6 Nov 2026 08:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793952646;
	bh=HACeClcT7h9LorXCovTw1HzucA+TfNbDbeRqmPZg37U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Emnr0l/5rFrDWJ0l1k17SdeetzIXxlkU9IL8tMaAGjxOQ3WbLjGP1OmbHVO9Vx9HJ
	 uF3eYnv79At3jDGOJRsPlFnrGNF2aIkZ9OnuOYQP/lCWrGO/VJ+Ak6VnoQdB4vj1BP
	 1W8TFXKy845M6kolr5lCRzdV1HrUjb9fHDfCgL7Xwn/7HcsJK9CNAiiu4dE9kUT61J
	 IqmSCmsBqKPbwQJo3aF9oPQOpCR8+k7FYN/rMcF7iJhAX6wfy+G5BgJCoKM3Cn2tai
	 2m8MtVpOESvqSB0hLrYFpTGRE/l4c7B3WLG0dl1wWi1k/D1evWirldctjS6DlRZf8A
	 ryIw4ZFPsaLyw==
Message-ID: <sashiko-outbox-201028@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add qcom,remote-owned pin
 configuration support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pankaj Patil" <pankaj.patil@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106-egpio_fix-v1-2-569d220a4748@oss.qualcomm.com>
References: <20261106-egpio_fix-v1-0-569d220a4748@oss.qualcomm.com>
 <20261106-egpio_fix-v1-2-569d220a4748@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 08:10:45 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Medium] pinctrl: qcom: incorrect pull-up bias reporting in
  msm_config_group_get() [1]
--

commit d1d6e2282f19bdb42f5fdbf3729ed8109d4061fb
Author: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

pinctrl: qcom: Add qcom,remote-owned pin configuration support

This commit adds support for the "qcom,remote-owned" pinconf property to
hand pin ownership over to a remote subsystem without changing the
selected mux function, and updates debugfs output to report remote
ownership alongside the regular pin state.

> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pi=
nctrl-msm.c
> index 32aa7b919e24a..4d96260f99090 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c

[ ... ]

> @@ -424,6 +453,17 @@ static int msm_config_group_get(struct pinctrl_dev *=
pctldev,
>  		if (!arg)
>  			return -EINVAL;
>  		break;
> +	case PIN_CONFIG_REMOTE_OWNED:
> +		/* Pin is not eGPIO capable */
> +		if (!pctrl->soc->egpio_func || !(val & BIT(g->egpio_present)))
> +			return -ENOTSUPP;
> +
> +		/* The enable bit is cleared when the remote owns the pin */
> +		if (arg)
> +			return -EINVAL;
> +
> +		arg =3D 1;
> +		break;
>  	default:
>  		return -ENOTSUPP;
>  	}

[Severity: Medium]
This problem wasn't introduced by this patch, but in msm_config_group_get(),
does the PIN_CONFIG_BIAS_PULL_UP case [1] need to check that
g->i2c_pull_bit is non-zero before testing BIT(g->i2c_pull_bit), just as
msm_config_reg() and msm_config_group_set() do?

drivers/pinctrl/qcom/pinctrl-msm.c:msm_config_group_get() {
    ...
	case PIN_CONFIG_BIAS_PULL_UP:
		if (pctrl->soc->pull_no_keeper)
			arg =3D arg =3D=3D MSM_PULL_UP_NO_KEEPER;
		else if (arg & BIT(g->i2c_pull_bit))
			arg =3D MSM_I2C_STRONG_PULL_UP;
		else
			arg =3D arg =3D=3D MSM_PULL_UP;
    ...
}

For pins without an I2C strong pull-up bit, g->i2c_pull_bit is 0, so
arg & BIT(g->i2c_pull_bit) tests bit 0 of the bias field.  Since both
MSM_PULL_DOWN (1) and MSM_PULL_UP (3) have bit 0 set, querying
PIN_CONFIG_BIAS_PULL_UP (for example via debugfs) on such a pin when
pull-down or standard pull-up is configured falsely reports
MSM_I2C_STRONG_PULL_UP (2200 ohms).

[1] https://sashiko.dev/#/bug/linux-42fe82f8-2ab3-4bdf-9d87-6f46c976e49a

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-egpio_fix-=
v1-0-569d220a4748@oss.qualcomm.com?part=3D2
