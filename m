Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742052;
	b=qSV4A/yIZj+bwesdV+RSzuG8o1BeXDBXcLSQmsdd53yN07WwGZVdMaV+QM/qWExiP9aV
	 SarpZQZvVZSFzFnJPQgePLPVVkCFkSDmIBOGzNbHqgRXeWZo9HaEWUxQHzMpdV/C4cC9w
	 lpYqIsuSsx1ZC6aR+aXMFdQGgO1dIO5k7vUeFDm3tYC0/FZWEPzEcJbyFDb2rVxl/6F5I
	 1VnJXDqFXsxcQCL0CQnF1mPE8Y1NvJpa4aMED3LjSgiojljMxbZrzKxEFen2bjt1PakDc
	 TtP6lCXJIGmteK9NdypBqpmEFOksuveD1abZRkE1R02Y1jTdosTZOfzfMN2SEBWs7MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742052;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6NvyIG4ISBMX0byZ6GfgPTSaNxkkkS0icAwU3yOVdXU=;
	b=Vc1NQZbbUS1Mxta1aTgR05ARSWUHBtz/CTV22huUNsOnIdEsRv0SfomvrwTQP1fCkVAx
	 33IT3X+breqP2fBegWUn5Nr5M0YgMxzfKfSRPbJ5kscH2cKNt0Z55HWxeZ/V80wgllqNK
	 ub+9xej3JRn3poFG4kChx0S4Q4BO9kyVYFjZP9tcnH47KB9nnfhRlsHWGa+Jwk00+OvIB
	 ax5gfggwGzfjFQQ8ZHGdmvyEf7ZY9GhMCjNcg7jAP4X++jPDqRZY0y4R6LwvBwv9kvAgp
	 JN+5jXgVJpwRDKQlC0c7ge4YpoBZ8Unm4w9A/yHHXNBr8ZP7OSTe8x2sgpTHOR7Txqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MnSebI68;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67C0606A31B
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 21:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MnSebI68
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 481311F000C1;
	Tue,  3 Nov 2026 21:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793742051;
	bh=6NvyIG4ISBMX0byZ6GfgPTSaNxkkkS0icAwU3yOVdXU=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=MnSebI68F1T2AgldXShVm0Bq1w6BxtWWjO6k/gKZ5cB2toqfzloRJOWhNKhOczYbU
	 VWq3aVW82XHGwR3JupbpnrSuc1if9bhws6o4g5N8FIvjhhveCXVyP6JxKYn7GbfvGz
	 k5Rj7AuuxB3htm5yyKEl9yHyjjAqWWDpelsd8JcT9P7M0wKOs0qHiqC6mYoB+GP6mA
	 JC82hCSaDRvqODoKxUy0H77Ng3vltYUPSLl4xUD/wSrtSgDBqP8fbB2tfkNlFe6WiF
	 UHuLUSz+x1AOFqUTRBKIMHyLyjlyyU8+q97IIrEkwMyf1uV+JuNUbAM8dKKt3KuRH6
	 yiOWefnElQmaA==
Message-ID: <sashiko-outbox-196066@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/10] pinctrl: mediatek: Clean up partially initialised
 hw->eint on error
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, linux-gpio@vger.kernel.org
In-Reply-To: <20261103213002.1673560-9-lee@kernel.org>
References: <20261103213002.1673560-1-lee@kernel.org>
 <20261103213002.1673560-9-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 21:40:50 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] pinctrl: mediatek: NULL deref in mtk_eint_do_suspend() on EINT ini=
t error
--

commit 8d040caade190db874ef6d84f338e06e2679ef73
Author: Lee Jones <lee@kernel.org>

pinctrl: mediatek: Clean up partially initialised hw->eint on error

This commit updates mtk_build_eint() to jump to err_free_base when
of_property_count_strings() fails or hw->eint->nbase is non-positive,
freeing hw->eint and resetting it to NULL.

> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/p=
inctrl/mediatek/pinctrl-mtk-common-v2.c
> index faa6dbf0f6356..aa15c9e047d89 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -382,12 +382,16 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct p=
latform_device *pdev)
>  		return -ENOMEM;
> =20
>  	count_reg_names =3D of_property_count_strings(np, "reg-names");
> -	if (count_reg_names < 0)
> -		return -EINVAL;
> +	if (count_reg_names < 0) {
> +		ret =3D -EINVAL;
> +		goto err_free_base;
> +	}
> =20
>  	hw->eint->nbase =3D count_reg_names - (int)hw->soc->nbase_names;
> -	if (hw->eint->nbase <=3D 0)
> -		return -EINVAL;
> +	if (hw->eint->nbase <=3D 0) {
> +		ret =3D -EINVAL;
> +		goto err_free_base;
> +	}

[Severity: High]
The commit message notes that leaving hw->eint non-NULL on these error
paths causes subsequent suspend/resume callbacks to dereference a NULL
pointer inside mtk_eint_do_suspend(), and that resetting hw->eint to NULL
avoids this.

However, when mtk_build_eint() fails during mtk_paris_pinctrl_probe(), the
driver logs a warning and finishes probing with pctl->eint set to NULL. On
system suspend or resume, mtk_paris_pinctrl_suspend() and
mtk_paris_pinctrl_resume() pass pctl->eint directly to
mtk_eint_do_suspend() and mtk_eint_do_resume():

drivers/pinctrl/mediatek/pinctrl-paris.c:
static int mtk_paris_pinctrl_suspend(struct device *device)
{
	struct mtk_pinctrl *pctl =3D dev_get_drvdata(device);

	return mtk_eint_do_suspend(pctl->eint);
}

Neither those callers nor mtk_eint_do_suspend() and mtk_eint_do_resume()
check whether eint is NULL before dereferencing it:

drivers/pinctrl/mediatek/mtk-eint.c:
int mtk_eint_do_suspend(struct mtk_eint *eint)
{
	mtk_eint_chip_write_mask(eint, eint->wake_mask);

	return 0;
}

Previously on these two error paths, hw->eint remained non-NULL with
hw->eint->nbase <=3D 0, so the loop in mtk_eint_chip_write_mask() over
inst < eint->nbase did zero iterations. With hw->eint reset to NULL here
(as well as on the existing error paths in mtk_build_eint()), won't
suspending or resuming trigger a NULL pointer dereference in
mtk_eint_do_suspend() and mtk_eint_do_resume() unless a NULL check is also
added?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103213002.1673=
560-1-lee@kernel.org?part=3D8
