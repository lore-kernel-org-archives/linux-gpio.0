Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896081;
	b=JImQYWmg2kWIFdeajeTuriphbF4t9XHizfmQRLld/9+E4SW6Y+l+kdAI4CQ7u8Rhat0N
	 Z+jfl3Mo9D04dwe9dfXSYpS9KU0DIzGk6OOZ8sWDce8zakXA3sND/bkcV4WkH/VKpN6w3
	 NDZjktz694BsxAT9hmhMMMVqjYHltP49CDUhvjyjk66kOBjU9OoZK6pxJsMc1ucczBZoL
	 VGGT6I4S1gxf7wk3SoFHmuoToFiiNIxu5M+ysRCbqRDMUaNIFyYlgOErMppuUSGR7QLiY
	 O8+wYwEpTKtrQC3dqY/s7kZx/0z0l2ewZw4o3ddrR4h+uSSSOO03ngp72JKW/7wOXcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896081;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Fm9dlHT0B6mlrWL5/neHSpvsX0ANrkqCuYQT4SZjHZY=;
	b=5cB5rV4i8PiIsnX8eVRhj0j3t4Z2UL7yJIBNOglGWnKrmUGeSc9WD1/viPyKGLvjVmAJ
	 fNOVtzb5qLnWO+lIp/pL+3t+miE5i2VMU2EHNwKENcQ6OHLTVcqxDgWFQnpAOukSqH9J4
	 bO0QnO5qJ/H2TYjRyxJ9g6vXOZoYm06IChs21supIlE4mRnHotrh43ae0lHh7OE7HkBKz
	 rmbcgWaGwWHDO9xCCqB/Fl2SrU4btxZe/MucQMy/Za5LxGaEypOgWBvA55uOrlz0Q7S41
	 LrlJL/mvTZQhoJN6g0ZQEw87u1yqaXFa6a97rQfgAx/c+e+LAGav+jpEVHm7sFO/AYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZAiQk+dM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F6C606D802
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 16:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZAiQk+dM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 722651F00A16;
	Thu,  5 Nov 2026 16:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896080;
	bh=Fm9dlHT0B6mlrWL5/neHSpvsX0ANrkqCuYQT4SZjHZY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZAiQk+dMgISH4UER8r3chD8q6uqnF1dgQL3aq0E88wCLE8U7A4Fdinn95K4IqaQGM
	 k9e8hR7meQ2Lv5qlO+atGKvmguz81I0isQhDMScWdlH70KVsGaxOD3c6iQPnk5lJZ9
	 a73KyuOPUe1JgUNHKYACdJwzQdeCkFDD6RAavOpTvjO7nHF6zj9jHPZUHg3KN371hV
	 qk58kcMiiTShn9Ky9BLyNkipMDaCpFs3p2U/6p9/h5hHOzybQN/khzacisL4A52KiW
	 ksxJwsM+9/NtxCB2lvwfBdd0zL4ao0bQxlrDsiGqBFMUlRMEj+yEfN0uiPmeUdl7gG
	 /gummmeTwKwaA==
Message-ID: <sashiko-outbox-199495@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] pinctrl: qcom: check the return value of
 qcom_scm_io_readl()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261105-pinctrl-qcom-scm-fail-v1-1-a23f96c6b313@oss.qualcomm.com>
References: <20261105-pinctrl-qcom-scm-fail-v1-1-a23f96c6b313@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 16:28:00 +0000
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
- [Medium] pinctrl: qcom: premature dual_edge_irqs update in msm_gpio_irq_s=
et_type()
--

commit 95e665aa134824797beb0596c04a8bbf7fde94f2
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

pinctrl: qcom: check the return value of qcom_scm_io_readl()

This commit checks the return value of qcom_scm_io_readl() in
msm_gpio_irq_set_type() and bails out on failure to avoid writing an
uninitialized value to hardware registers.

> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pi=
nctrl-msm.c
> index 32aa7b919e24a..0053d1d927dc1 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1117,7 +1117,12 @@ static int msm_gpio_irq_set_type(struct irq_data *=
d, unsigned int type)
>  		u32 addr =3D pctrl->phys_base[0] + reg;
>  		int ret;
> =20
> -		qcom_scm_io_readl(addr, &val);
> +		ret =3D qcom_scm_io_readl(addr, &val);
> +		if (ret) {
> +			raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> +			return ret;
> +		}

[Severity: Medium]
Just above this block in msm_gpio_irq_set_type(), pctrl->dual_edge_irqs is
updated for the new trigger type before qcom_scm_io_readl() is called:

	if (g->intr_detection_width =3D=3D 1 && type =3D=3D IRQ_TYPE_EDGE_BOTH)
		set_bit(d->hwirq, pctrl->dual_edge_irqs);
	else
		clear_bit(d->hwirq, pctrl->dual_edge_irqs);

On platforms like IPQ8064 where pctrl->intr_target_use_scm is set and
g->intr_detection_width is 1, if qcom_scm_io_readl() fails and returns early
here, msm_writel_intr_cfg() and msm_gpio_update_dual_edge_pos() are skipped
while pctrl->dual_edge_irqs retains the updated bit for the failed transiti=
on.

When __irq_set_trigger() then restores the IRQ state on error, wouldn't
pctrl->dual_edge_irqs be out of sync with the hardware interrupt configurat=
ion
inspected by msm_gpio_irq_ack()? Should the pctrl->dual_edge_irqs update be
moved after the qcom_scm_io_readl() check succeeds?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-pinctrl-qc=
om-scm-fail-v1-1-a23f96c6b313@oss.qualcomm.com?part=3D1
