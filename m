Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036F637B01C
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 12:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778502906; cv=none; b=Wk6wrJ4CcvFmpX696LqfcCHm5ZlSZre89F8Ky6pEuEWV5OL1nXPgQKqp8ZfdmVV1Q2F7JljduZkSsa4tMRCzir96PV3qzrP3uh7eyX0Luxj+3Ah2JzmeNVaWxCAybFub9MlAgcyirBJKpCgF4SbFkmY2TYb8QCvHRDiWvss8468=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778502906; c=relaxed/simple;
	bh=wksMnabfk+5vx3Sxfy95oD7M/0/qtves/JLzMFazvws=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FMGfJ9PJBt6R+EsbJ69ShB0VthoQrJxH9YbM56qzDhoqs7dQLoOKeF1crqhl74KIwvg1oL3/AFu3BNCuGxw5qyPduHFtv4CwT6DAIR1MqhYd44/xrcJPlh9AXO9U/bUXkw0Y651w387MFxCkJh2ukWPpIVqgcR7vtjDMHs6xgWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jeNL3u2H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jeNL3u2H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 953CCC2BCF7
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 12:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778502905;
	bh=wksMnabfk+5vx3Sxfy95oD7M/0/qtves/JLzMFazvws=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=jeNL3u2Hr1DK9tZYIX7DP0LdjZzPKujCGoi7z2YIcPU1yOcCTbS5AacUuTFnw9/AB
	 bL0LgDAVp2am6GZwoYjS7QeP5x+COrYg5oRMECdz678sN9wCecXyIzzr7KPFuEiPKD
	 +1LAWTEYtud5NWi9CIK8K+0oUR5xUynfDlLQhefjWQnSsRXfesqYY4V+QlUqehd2LG
	 T1/QCraVHiVp25MTT1uH4uR7uGbwygeAPYmKI25WvpVUds7UEZD6qB16/qb1L4V/SJ
	 Gh0brXrK0UxUD+0uEn/PyXLB20it7um3qROz6zvFy/lZiHrxldMcj046lfA6CUubAw
	 2uf2i8oKxmn1w==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38e7d983f79so36964801fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 05:35:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9yNpqfGzzsaQ1bDufItWYT3RcWhEwS1werJev01vFVs4Lg4utuUFBLosUVKsofceofkBLQgxvh3i83@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/xjMLT0oNTWq+EmqkCUQ9URt3i2KBKa9IlSio6AfPH+GoBgY8
	8WnOfriGTj1kQcw7MhenIfN+oNuShtsNoC98NGx8rlQmds56p8Q1qm+lNrefrLD1P8+zB1TBqb6
	fY2Ek8geegUlBnDVsdDxGgGx9sT7mXF+kBZwnao60Mg==
X-Received: by 2002:a05:651c:3242:b0:394:75b:eb3d with SMTP id
 38308e7fff4ca-394075c0404mr32533721fa.18.1778502904229; Mon, 11 May 2026
 05:35:04 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 05:35:02 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 05:35:02 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260508143453.1886569-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508143453.1886569-1-ckeepax@opensource.cirrus.com>
Date: Mon, 11 May 2026 05:35:02 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeEJXtx4zO047gDWjfF5JTOBbLR9D=SwOvqf3_TL-Z+BA@mail.gmail.com>
X-Gm-Features: AVHnY4JmSJVXR0f4Bey-srANH1hOQZnAuEqSs5R7xHNJC2A6_rORGZb4BvQaHW4
Message-ID: <CAMRc=MeEJXtx4zO047gDWjfF5JTOBbLR9D=SwOvqf3_TL-Z+BA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: cs42l43: Fix leaked pm reference on error path
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@opensource.cirrus.com, linusw@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 May 2026 16:34:52 +0200, Charles Keepax
<ckeepax@opensource.cirrus.com> said:
> Returning directly if the regmap_update_bits() fails causes a pm runtime
> reference to be leaked, let things run to the end of the function
> instead.
>
> Fixes: e52c741907fb ("pinctrl: cirrus: cs42l43: use new GPIO line value setter callbacks")
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  drivers/pinctrl/cirrus/pinctrl-cs42l43.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
> index 227c37c360e19..3cc1835206077 100644
> --- a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
> +++ b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
> @@ -499,12 +499,10 @@ static int cs42l43_gpio_set(struct gpio_chip *chip, unsigned int offset,
>
>  	ret = regmap_update_bits(priv->regmap, CS42L43_GPIO_CTRL1,
>  				 BIT(shift), value << shift);
> -	if (ret)
> -		return ret;
>
>  	pm_runtime_put(priv->dev);
>
> -	return 0;
> +	return ret;
>  }
>
>  static int cs42l43_gpio_direction_out(struct gpio_chip *chip,
> --
> 2.47.3
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
