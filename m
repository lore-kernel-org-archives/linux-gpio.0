Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500115;
	b=3Y/RCRuLyL9KJ9fkNny2sjQuOGiVhCY7k2lLDbIuOolN/PcmfnbLW+9qkEaUOu8KRZYJ
	 trFhT05xOeNzvXhd18akWecbDoWKLQkx/qIqnEHW6MtuIIy6WgeWeOAiaKYa8gN7XamHP
	 mozoiuskui8CeV7EuCSFXTa+iBrgo6xqBthRBlSEw+phP+IWLBIuy2JZX6pd+eH5Ck5b3
	 sGGGJwPqemRNyszo3uJ6FNxcEhjy/v3tisoe+Z1p7yfhbSXCoyE0jsCd5ElZ0+/sQzBKh
	 H6Hz+LS2Djys4R0zHto17nLc7QkoxJu5j2wkcVI3fEDwSPQacxmTF7XdS3rQ+LbeKUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500115;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=/KjkpuXOQc02cY2McfdMzArCTMAfJu7UfGVrhriKNw4=;
	b=SiMUah7jsPC8DTMXkkJv1O/ffCx5jSF0dv0LrmLO+GYPn4Bt2XVJzcejBzD3MCuwqAnJ
	 vg4H5gAlMgyvp3sYV5BAMQd6a1RzDm/FWN9TJMS+WRnrlYMxEBcMTWZZzrkeZY2R6wM1c
	 88jTyTxGLGgd1XyBz2Yq9xoVdYw7i/FDbijJvB03W7b3AZ5eMvvC+OaW05QVRelYwW2oH
	 6wmMTdSVi/6d9sqcgU1Xc7Qg+81+zLILZOnNYOyLt/LMn6J/U9O1ksRIygC3lgD5JX8I6
	 zc78AQo2+MpPuMRcfZXILup01vswSOCuB6WeyEUUZg7RhPMpjFuiI3IZv7MU7LVFVJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H3QMTgXS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id DAB8C606A32E;
	Thu, 12 Nov 2026 16:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H3QMTgXS
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 914971F000C4;
	Thu, 12 Nov 2026 16:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794500115;
	bh=/KjkpuXOQc02cY2McfdMzArCTMAfJu7UfGVrhriKNw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H3QMTgXSHz2O459pGAJTEQ38sCmik+U1N5kIMOKuvVS7tfBNBMe+j4RT1ej/IxuYK
	 +n/HfVEfrV7eQjrvl2uzQDsdaIeMKjZ678nLqQkRVewqn40r/0FiJv2mUXj8bY+abU
	 OKPriIqudTnFhF434GQiTC9+T2XjBhu0xBn4CcVMok+EWbkN17Q5wnEHIZcY88R6Va
	 /ZfEBvNPKlvvaYSStR4VZOibqK7eu8gslBNVZWz7udaSweA6NS5trCdhjGKjlPfPQB
	 bnVzLqboLbE9HpEWCQPT5XGiNYCjENTEuNz09oSetuwgfbc7r/tpiDrPcFltVTyweD
	 eAUnQMn5zDuCw==
Date: Thu, 12 Nov 2026 17:15:11 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/11] pinctrl: scmi: mark the GPIO functions
Message-ID: <m2f3tyenb4udselq5xotvgxp3fijcyprdae724oroefyw2d3ar@4rswobkdrd3i>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-8-52d92843ad97@baylibre.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-8-52d92843ad97@baylibre.com>

On Fri, Oct 30, 2026 at 04:58:39PM +0100, Clément Le Goffic wrote:
> Register the functions flagged as GPIO with PINFUNCTION_FLAG_GPIO.
> 
> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
