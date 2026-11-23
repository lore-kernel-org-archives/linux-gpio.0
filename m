Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444639;
	b=vtRl0Y0WwKBzLnH7Qb15DgFjTiMjyzuk8JTgb2RsZSqFZRW31uyJ1batLbhZpEtgTZ6y
	 mKKfp+e5bxoCMvw/XoZ44cmzmv4FVE31nevtz23Ww202Td89BLSuC4S+55NR0knwH1pnr
	 zLnORQd9Cvkuo3+eSCD2QtBvl4JX5SMR776/uDrwDumQcX8d6gUQP/RlZg/KNp0nAr7po
	 M8qpR3Ud9VPMC6ftSMCYaktkBvU0DlvyQaAJyQAoR1MuHUXDFvNtVPZOFsD1l9nv3MdRQ
	 GA5yxvOXfGgmVUietihP5GxlYTi3lY6OnC0egaTE1K0LRtU6284QTuK1R0D70TeUisg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444639;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yF8l/otjZdcWa8UVmjb9t4v+f6W5Ozd/HXJxZeHUKjo=;
	b=4kaN9yJkMxApZm6gOgbd1DIj8M/mB2478Nb8i1vM9Prz5Er4OSQtem703EaTWhxLKEHs
	 HIKOlwHje6fSrZQLDjfS4D+KmVR+RUgwiDbSx1qr6tg+IQ7NTv0nebklmr7oNcmg0ujde
	 tb96MERlnSHMJ+zYiEvcHroUKPPEfU0pHOdZGjiC/LhqqwHmDhL/l6Cm51WpHXwvzttEf
	 WW6uOufpzSsPDoJMjZ9oovb+0fTGDksxnRbNFgCVIrf1BMPlGWLvzDfoULc22zN2m+YGB
	 rnwndkbPYu2BjjUuSE8vGQ1iT92l+Bp8CbAUolC2to4nX5RgDAJtGFqBpKPC+Qqlgsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iWEybZQq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id EC8E1606A31A;
	Mon, 23 Nov 2026 14:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iWEybZQq
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 411A51F000CF;
	Mon, 23 Nov 2026 14:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795444638;
	bh=yF8l/otjZdcWa8UVmjb9t4v+f6W5Ozd/HXJxZeHUKjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iWEybZQqTqJxzX3By05DzyDWzJPL+adm9ZNT2aPCMjIuiLgzQkyOJdYfcfnRVxGHM
	 QXeZqZ3UXYtzUVi5oHxQJ9fhV5Syp1VKFnVa4sstbvnHwjRDuFAVmvJv4X6Us4eqQ/
	 4pEOOvQBe34P6mJgm1frRrKzBlYEizR2dlAWN3awdz/tRnZaOUo62nzCP8uBr2GZ3E
	 RBOYux9dCuzJLmqaKCnfF8Oof3RcuSPF8PSKPg7mYR9cQxJopNjR0l7s1GZLf7AAPd
	 qkQc7wwEstui/0AcOqvXiTA3IQ54t7HwIMlO3frdZxH9WDFbZlrW3Bbt5ob5mHnddu
	 tDTszKppaF+eQ==
Date: Mon, 23 Nov 2026 15:37:14 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] pinctrl: qcom: lpass-lpi: Move dev_pm_ops to the
 common driver
Message-ID: <p34xkm4wlsghaebt2l4wodmoekk43tlfimzguq62stqc6uf75m@iatnz5hhflwy>
References: <20261118-lpass-lpi-system-sleep-v2-0-a6ec7f2ba424@oss.qualcomm.com>
 <20261118-lpass-lpi-system-sleep-v2-1-a6ec7f2ba424@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118-lpass-lpi-system-sleep-v2-1-a6ec7f2ba424@oss.qualcomm.com>

On Wed, Nov 18, 2026 at 07:07:30PM +0530, Gopi Chandra Sekhar Reddy Kanala wrote:
> All the SoC-specific LPASS LPI drivers probe through the common
> lpi_pinctrl_probe(), which sets up pm_clk and runtime PM, and each of
> them defines the same dev_pm_ops with only the pm_clk runtime callbacks.
> 
> Define the dev_pm_ops once in the common driver, next to the code that
> sets up pm_clk and runtime PM, and export it for the SoC-specific
> drivers, so the PM callbacks only need to be changed in one place. Drop
> the pm_clock.h and pm_runtime.h includes from the SoC-specific drivers,
> as nothing there uses them anymore.
> 
> No functional change.
> 
> Signed-off-by: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-hawi-lpass-lpi.c     | 6 ------
>  drivers/pinctrl/qcom/pinctrl-lpass-lpi.c          | 4 ++++
>  drivers/pinctrl/qcom/pinctrl-lpass-lpi.h          | 3 +++
>  drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c    | 6 ------
>  drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   | 6 ------
>  drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c | 6 ------
>  drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c   | 6 ------
>  drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   | 6 ------
>  drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   | 6 ------
>  drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   | 6 ------
>  drivers/pinctrl/qcom/pinctrl-sm6350-lpass-lpi.c   | 6 ------
>  drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   | 6 ------
>  drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   | 6 ------
>  drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   | 6 ------
>  drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   | 6 ------
>  15 files changed, 7 insertions(+), 78 deletions(-)
> 

Ok, I do like this diff after all. I'll queue this for v7.5.

Bart
