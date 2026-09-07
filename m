Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B83443E2A;
	Mon,  7 Sep 2026 09:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775000; cv=none; b=WKeO9c8NONuwtM1omVL85NDfd5SSLf0NW1luzMvqH/sxdFbcjgTiuKUtBU8EW/fmzEHL3jCedNk/+gyusK/uZcSUDvv0bEywkaC4/wtgnGgCF1H9o+yZ45sikOrF7HgIoUrwCb/YjWwnQ5a0ABx4mXFCn65oMjF9JsgRpWoBJd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775000; c=relaxed/simple;
	bh=tLuftGWElaAy7DrwHFvbWwt+3loDsMhahHMpCsE5o3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P32Cx0z1PrQZ/cRoCAuJLTFrh6BTYbGgnspjEwl4hNbic30MMpWsgO0+LB67tHlQbuekfa50aKaE8PCJS1spRb6EwoH/3StldQBQRi7zK64sEGQWBXXLN1odX9znRyRA3dX7c42d8sAoSob8dYhlX42txLoCArnc4wXqlKv1IV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S63ThCpW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S63ThCpW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E3EF1F00A3A;
	Mon,  7 Sep 2026 09:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788774993;
	bh=1F3L274613R1LiFA2kHbs371zCXnqilQj5GuvQ6D8Vw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S63ThCpW9JVL+vaqfAslVE6pgqCHNUtICpsZpBy6aNzhAofdso+qizm8SCEYYokHt
	 uR8FIcbOuTOPUpuNtPuYwTyYbPWXa0+LCQMLh3TE+UHpIAqWXDo8VqyQnYxJXX0AtW
	 28uXZP8fEjfbBIz/+4Oz3uhMmCXMMll1VD0uD1W24mcLKJJ+DWyWnhHZJ9CFFxxcru
	 fNdAHHTs2fuP9c5Mtefp+heaZ3+N5ZqsosQQZVmABrOvdPaAJ/WvjAJDeQnOjSdRO7
	 ShBRr7Al6Om2vJTdRgzzuVBW2ne5kywSt9TeM94M2TqXIiWm3R9HOfBkwhs5YImFky
	 MDnpqQHahr71w==
Date: Mon, 7 Sep 2026 11:56:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Muzaffer Kadir <muzafferkadir@mainlining.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add MSM8952 pinctrl
Message-ID: <20260907-comical-nondescript-bumblebee-edc62b@quoll>
References: <20260904-msm8952-pinctrl-v4-0-671475ed1397@mainlining.org>
 <20260904-msm8952-pinctrl-v4-1-671475ed1397@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260904-msm8952-pinctrl-v4-1-671475ed1397@mainlining.org>

On Fri, Sep 04, 2026 at 03:55:08PM +0300, Muzaffer Kadir wrote:
> +        enum: [ gpio, blsp_uart1, blsp_spi1, adsp_ext, blsp_i2c1, prng_rosc, qdss_cti_trig_out_b0,
> +                qdss_cti_trig_out_a1, blsp_spi2, blsp_uart2, ldo_update, qdss_tracedata_b,
> +                pbs1, pwr_modem_enabled_b, blsp_i2c3, gcc_gp2_clk_b, atest_combodac_to_gpio_native,
> +                ldo_en, blsp_i2c2, gcc_gp1_clk_b, atest_gpsadc_dtest0_native, blsp_spi3,
> +                blsp_uart3, sec_mi2s, pbs0, gcc_gp3_clk_b, blsp_spi4, blsp_uart4, pbs2,
> +                pwr_nav_enabled_b, pwr_crypto_enabled_b, blsp_i2c4, blsp_spi5, blsp_uart5,
> +                qdss_traceclk_a, atest_bbrx1, qdss_tracectl_b, qdss_cti_trig_in_b0, blsp_i2c6,
> +                qdss_traceclk_b, atest_wlan0, m_voc, qdss_cti_trig_in_a0, atest_bbrx0, blsp_i2c5,
> +                qdss_tracectl_a, atest_gpsadc_dtest1_native, qdss_tracedata_a, blsp_spi6,
> +                blsp_uart6, atest_wlan1, mdp_vsync, pri_mi2s_mclk_a, sec_mi2s_mclk_a,
> +                cam_mclk, cci_i2c, pwr_modem_enabled_a, cci_timer0, cci_timer1, pwr_nav_enabled_a,
> +                pwr_crypto_enabled_a, cci_async, sd_write, qdss_cti_trig_out_a0, gcc_gp1_clk_a,
> +                gcc_gp2_clk_a, gcc_gp3_clk_a, blsp6_spi, qdss_cti_trig_in_b1, uim_batt,
> +                qdss_cti_trig_out_b1, uim1_data, uim1_clk, uim1_reset, uim1_present, uim2_data,
> +                uim2_clk, uim2_reset, uim2_present, uim3_data, usb_fs, uim3_clk, uim3_reset,
> +                uim3_present, atest_char3, dbg_out, bimc_dte0, sec_mi2s_mclk_b, pri_mi2s,
> +                atest_char1, ebi_cdc, atest_char0, cdc_pdm0, pri_mi2s_mclk_b, lpass_slimbus,
> +                lpass_slimbus0, lpass_slimbus1, wcss_bt, atest_char2, ebi_ch0, wcss_wlan2,
> +                wcss_wlan1, wcss_wlan0, wcss_wlan, wcss_fm, ext_lpass, gcc_tlmm, dmic0_clk,
> +                dmic0_data, qdss_cti_trig_in_a1, blsp_spi7, blsp_uart7, pri_mi2s_ws, wsa_io,
> +                blsp_i2c7, blsp_spi8, blsp_uart8, blsp_i2c8, gcc_plltest, nav_pps_in_a,
> +                pa_indicator, nav_pps_in_b, nav_pps, modem_tsync, nav_tsync, ssbi_wtr1,
> +                gsm1_tx, gsm0_tx, atest_char, atest_tsens, bimc_dte1,
> +                gp_mn, gp_pdm_0a, gp_pdm_0b, gp_pdm_1a, gp_pdm_1b,
> +                gp_pdm_2a, gp_pdm_2b, gp0_clk, gp1_clk]

Honestly, change of a string in some big blob of text which has no
practical impact on the binding is not a reason to drop a tag.

Changing compatibles, changing types of properties, adding new
properties would be. But how does it matter "adsp_ext" function was
addded...

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

