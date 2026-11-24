Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531186;
	b=KvPBlei0BNeI79fxQGGYq1Nin8jy55kbY4bsvSoiiSJifS4Jkl99ULSck0xxg2qyv2SG
	 fpVtlwcxMvHqSi5Xm8OXXl9VLEYDpcrszayVTYe+escJHe5gATiMCfqEN1aBcBrepSRhY
	 9DT7O26vEyr6VetSvN1P4PWrcQKl4RZz6y+imvzJikqKXVxz4Nc/TiJQX8TpM895/CCJt
	 QKgIqnQ5VWzQ/SYqq4KmOQh3K57E6g1ULKPf01KJwztvT5M38ajufAYbH3UuX0kaRj7q2
	 G0iQ89uhI6UDYtlaHLo1Fqh9fK4McmcsalSidXY3cvdHMbS/95zEueKrv9GDdET4UMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531186;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BALpXu5DaPbGQwhPAGTK0L1D3/2Oi6Ci/buea7q5JWs=;
	b=O9WT91xonHXLjbGMVL/i46i+hfFWSgHyLVaMX6f+0ERP5H+jWyfEdSMltSMltTGQhTWf
	 gVJkJ9URQBoMzDpyqbLdi9XoHVcCbExkyEW1qeLkgkACFg2Z6oAGiDjKNlpWc5+KOSw+4
	 rU3LZ3Yi1VmKW5pKJ+o3NMVRqMdonkRXjlerv6lqnJpwz/5xYg6uAC0zDyp5uQeSWCH0d
	 r939lZNfKMJspVKVZmCIEPNfoDD2gTty+IahX90fbrRovSC/mmpeflfcA3aDb95PnA7RD
	 GmJcugOup/cbY+uN3O8bNj0agIU3V+r0F4xyB7Tr9thc/pYzMbu88q1hSru5jNCrbEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S6azbMqf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 0D07B606A334;
	Tue, 24 Nov 2026 14:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S6azbMqf
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 998951F000D0;
	Tue, 24 Nov 2026 14:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795531185;
	bh=BALpXu5DaPbGQwhPAGTK0L1D3/2Oi6Ci/buea7q5JWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S6azbMqfvgeaacka2PUPH8VrQZWkjaBxB4GqaqA2YK9NFpKltTkFjifq5+QvmQyVj
	 lledI2KMOllvCW++n5SuFnkSoIRb7QltKxGZUxOPVoqcfNwWMTcJzIP8rc0NdhPZeo
	 GQP4087oNI4kgzlA1RR1jzRU8Uekj5Rspsk8YE28rR8/SJ/tbN3F3cS+lI+coXTkh+
	 MwoGesj4SKK5JOmgfADAslg7fCDltjlGRsHC/UhkeEwIVVb9YuWsXoEU65bC/LpONf
	 u3hj8zMhbwPK06dcFLMvku5qYz1Hlq8Ha55y/6S7iWu6gxZNkcBkc0nGaFEZf7X+FT
	 A/CVzV/vvo0Mg==
Date: Tue, 24 Nov 2026 15:39:41 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] pinctrl: qcom: Add Halliday pinctrl driver
Message-ID: <cqmq733runeddhskuodxud7j4ziszob2eta4vrmz7puw5p3erp@edl3sdk6cpx2>
References: <20261124-halliday-tlmm-v3-0-6b516e5f269c@gmail.com>
 <20261124-halliday-tlmm-v3-2-6b516e5f269c@gmail.com>
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
In-Reply-To: <20261124-halliday-tlmm-v3-2-6b516e5f269c@gmail.com>

On Tue, Nov 24, 2026 at 02:18:52PM +0000, Stanislav Aleksandrov wrote:
> Add the pinctrl driver for the TLMM block found in the Qualcomm Halliday
> SoC: 224 GPIOs with their functions and PDC wakeup interrupts, the UFS
> reset pin and the SDC2 pins.
> 
> The tables are based on Qualcomm's downstream pinctrl-anorak driver.
> The exact PDC map was provided by Bartosz Golaszewski.
> 
> Link: https://lore.kernel.org/r/wkceygbndcdv2ldsemla27mn5dnzdeijowvxpjozee73wyze6r@mlmymb7cehm4
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

...

> +
> +static const struct pinfunction halliday_functions[] = {
> +	MSM_GPIO_PIN_FUNCTION(gpio),
> +	MSM_PIN_FUNCTION(atest_char),
> +	MSM_PIN_FUNCTION(atest_usb),
> +	MSM_PIN_FUNCTION(audio_ext_mclk0),
> +	MSM_PIN_FUNCTION(audio_ext_mclk1),
> +	MSM_PIN_FUNCTION(audio_ref_clk),
> +	MSM_PIN_FUNCTION(cam_mclk),
> +	MSM_PIN_FUNCTION(cci_async_in),
> +	MSM_PIN_FUNCTION(cci_i2c_scl),
> +	MSM_PIN_FUNCTION(cci_i2c_sda),
> +	MSM_PIN_FUNCTION(cci_timer),
> +	MSM_PIN_FUNCTION(cmu_rng),
> +	MSM_PIN_FUNCTION(dbg_out_clk),
> +	MSM_PIN_FUNCTION(ddr_bist_complete),
> +	MSM_PIN_FUNCTION(ddr_bist_fail),
> +	MSM_PIN_FUNCTION(ddr_bist_start),
> +	MSM_PIN_FUNCTION(ddr_bist_stop),
> +	MSM_PIN_FUNCTION(ddr_pxi0),
> +	MSM_PIN_FUNCTION(ddr_pxi1),
> +	MSM_PIN_FUNCTION(ddr_pxi2),
> +	MSM_PIN_FUNCTION(ddr_pxi3),
> +	MSM_PIN_FUNCTION(dp0_hot),
> +	MSM_PIN_FUNCTION(edp0_hot),
> +	MSM_PIN_FUNCTION(edp0_lcd_self),
> +	MSM_PIN_FUNCTION(edp1_dpu0_lcd),
> +	MSM_PIN_FUNCTION(edp1_dpu1_lcd),
> +	MSM_PIN_FUNCTION(edp1_hot),
> +	MSM_PIN_FUNCTION(egpio),

Please use MSM_GPIO_PIN_FUNCTION() here. See the series[1] I just sent out
too for reference.

Thanks,
Bartosz

[1] https://lore.kernel.org/all/20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com/
