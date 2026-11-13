Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794574158;
	b=GsGXfxxM3EmdWWz7pV2Aolj2ab1dchBbPr+TRgF0wZN88Qlh0f5kEGuCSusInc9bP5Je
	 1n0fE5DEjheZp6TzIkiJf35uI5m1hBTW45TvcUGEE5sPqasRYCN3Si6oG+Ju4sIHGYv2H
	 R24+LPNoXcBC/yaTEO8GcZMn401NFEwsmGWsddIcpsdPWzAO2BXSWcLp7QI/yWbaZt5VR
	 0hCIcn9hwN8QxMKAGYVtXUhJIWwCSV/jO8afJ+DjbSWslr20VSrb+dXbwLzm+uO1WI8c+
	 e7sqTuddXksuSUw1QylXJo5i7aOm+r1hwkpyA8Ya9HBwvcslvtqTHsn5Mee/ZGPHgmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4s+uD7Kz9Ds6anaBbLwZ6WOQF/1zwYR8W1iYVgZ85Qs=;
	b=cCJq1GJFZSps96D9hDxfehvoN/Jr30gRpeiT7JQkjd0Alug1NTuRhJSSvAyiD1v+Ebh6
	 JSZbzQpv7LBJ+bl/ezctIall7IPLqvTRP2LjpyzeMgdUHsFZsrBTStCNrgHRKOaxU9Zxp
	 +FKE/HN5f5dEvmE3zeHMlJPnpgunkgE133PzkZwLwv9jmdjM4xG1kF6eZ2ao+maqRiDAv
	 WejFBLL/yuVsGNVHkP1qAHme+5DHLibc+y/1fMUzVlMFRrop1TKsqMEIHlENy8JdE0Dkd
	 eSXf5F6YHdYVIwemmY4H9mGZvtu79X37MdktnyZMeyukdB1ErnJAUaYnELexndgjrhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZRl7mmvk;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44B8606A32D
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 12:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D44B8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZRl7mmvk
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso6020315e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 04:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794574156; x=1795178956; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4s+uD7Kz9Ds6anaBbLwZ6WOQF/1zwYR8W1iYVgZ85Qs=;
        b=ZRl7mmvkaSOIpgi+00caNJisqCQ3juMe9GT1Ap/MOAR2/b9P8lMZu3tKC+u46S6S8j
         TUtCGf9pGgw8bFnDyqt5+kMJF83zC4Kl1naCDywqU2o3uTZacTBvNwL8fV3RSBrVp3xX
         cy7eOQDs2KD/yllkBUnUK79KWwmVkLxhK8LdAqasPNzgeg/enoPy64WJvWRD069WGzQn
         WtUHYDemOsrGKNh8VjEOZWmExYqWG1uc8nVukxhvFwL/eHpU0TU8kwQzZS12G5QY11Y/
         ZZUjSVuBdDRV6Zsh4ln7OH/xqMufXHEqXOu5n++yNPe2xbLgTR8Pkp9+CPoREun3SjRm
         EzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574156; x=1795178956;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4s+uD7Kz9Ds6anaBbLwZ6WOQF/1zwYR8W1iYVgZ85Qs=;
        b=oBjxQZBnXeQGugmripppq0WyJHdRnNxB0y4smm3ZkzorVTZiZR1zoughN7/Tt3t8yo
         vXci4DIspmhcGIn0eg+YoHReWYd+tuLJelcBR2HKarrx0NgXtjz1F03K3Sg527ShAgTJ
         GUMH/vhpnjddyQYveFOX6DJYBpLSJIZ1LESGs7CuqzhCGREANne249yCsMykhjZvql8U
         2oGwjLGsoMRazzutS7h4oDbM/mULTnOmvNa8AmO3zF8ZX57qbcxEB5VS/uFt+KI4m9zW
         Rw2NM1J6uyM0SnveeKTDUO2Rr1zEVuEB6rAdgOnAmIrbKxToMi196blWO86rvbjeYOK2
         M5fA==
X-Forwarded-Encrypted: i=1; AL+hErHIfKisWS8ikYFaaHB2Ektl9kzrpau77ISDsUa2PxkwvAydkqB+jhpnmDqufOVPJeeB4D1yLWdPSPR7@vger.kernel.org
X-Gm-Message-State: APuU4Z/PRyc1scCKylonJT2mdg97/TIiu3dCvzgc52afvUzxbptwQa3v
	9X4+SngiGZRlVWQPk58qwXVKCPTj+T+KOOPAKFH8XTudXiwBHLpBcRF4fZP/DIowGXw=
X-Gm-Gg: AYBFou2EszaM3BnAX1KT1x83CXc+XhWq9Y2aExD/H6zxGJnAqUTUioUPEvBsgO2lpCL
	d8Io04COrf9eaf8hhdQtfWCww9Lx0M249m+0Ze8unkz3/DXz0HyMqjHj87cXrcWQg5ymppK5MGh
	JvL5JxtNh17Ox/5MU+r6CHK9/xxFn+UIwGZ5dqSLeV9nBt4+2OtBvkW5UdeLFv4hlGDyqAgNYQ/
	5vdQO57w/BSBD5gV48E67yCFBrzeMm9T58YSq5m2dj2NTL4PQsYrUmr2j2VILbYnnerG7XsZLhd
	VeMrKaPY37DKZELra517abmF3Mu4aspwUaYAyJw9kL0l9S22YjxXZRLkPgu36ANGngrRnQt0mDR
	tVYKHsVleAvSION0f8Lo7XfRRASdfRM8O4vqUc2tSEK77+LLuwO2+5FOAmLSc+4N7FxvdLEq2vc
	w32Kg33sCpfgq5h9cDimy1mUZVGsD4YYm/eiDID1CVWdHSIhgNsbG9WbaXHIfncUFCdDX5n97TQ
	KzRU8TEMgSfIHDo9iPpBZpNKz/8YhTY1oDbS+4yAdL5wgtvud+lp15ZkDoIFL9gFq4aGxoWC3Cz
	wWy9BRTyH8n4F9hx/XG2MHatYTAY
X-Received: by 2002:a05:600c:3487:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4bb55a4f1b4mr52848935e9.13.1794574156179;
        Fri, 13 Nov 2026 04:49:16 -0800 (PST)
Received: from localhost ([82.145.117.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60da0a03sm4122315f8f.53.2026.11.13.04.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:49:15 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 13 Nov 2026 13:53:13 +0100
To: Xiaolei Wang <wangxiaolei01@kaihong.com>
Cc: linusw@kernel.org, florian.fainelli@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	daniel@dragonzap.com, iivanov@suse.de, andrea.porta@suse.com,
	phil@raspberrypi.com, linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jonathan Bell <jonathan@raspberrypi.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 4/4] pinctrl: bcm: Add missing SGPIO entries to the
 BCM2712 AON tables
Message-ID: <avcIOTzDFrI3rGZY@apocalypse>
References: <20261113053221.3131068-1-wangxiaolei01@kaihong.com>
 <20261113053221.3131068-5-wangxiaolei01@kaihong.com>
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
In-Reply-To: <20261113053221.3131068-5-wangxiaolei01@kaihong.com>

Hi Wang,

On 05:32 Fri 13 Nov     , Xiaolei Wang wrote:
> The BCM2712 AON controller describes six SGPIO pins as pin 32..37, but
> the AON function tables stop at the last normal GPIO: pin 16 for C0 and
> pin 14 for D0. Both are indexed by pin number, so dumping the pin list
> walks past the end of the table:
> 
>   A=/sys/kernel/debug/pinctrl/107d510700.pinctrl-aon-pinctrl-bcm2712
>   cat $A/pins
> 
> pinctrl_pins_show() hands desc->pins[i].number to pin_dbg_show(), so the
> list jumps from the last GPIO pin to pin 32, where a valid mux bit makes
> brcmstb_pinctrl_fsel_get() evaluate pin_funcs[32].funcs[] outside the
> array. The set path walks the same table for any DT node that assigns a
> function to aon_sgpio0..5.
> 
> Add the entries as pin 32..37 to match pin_regs[] and pins[]. The values
> are from the downstream driver (rpi-6.12.y), which keeps separate C0 and
> D0 tables; they differ on the HDMI1 and PMIC pins, where D0 selects
> vc_i2c0 and vc_i2c3 while C0 uses vc_i2c4 and vc_i2c5. The empty indices
> in between are harmless, their mux bit is zero.
> 
> Tested on a Raspberry Pi 5 (C0): "cat $A/pins" triggers a KASAN
> global-out-of-bounds report in brcmstb_pctl_pin_dbg_show() with the
> driver as-is. The D0 table is not runtime tested.
> 
> Fixes: 657cbf9b24ba ("pinctrl: bcm: Add STB family pin controller driver")
> Cc: Jonathan Bell <jonathan@raspberrypi.com>
> Cc: Phil Elwell <phil@raspberrypi.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Xiaolei Wang <wangxiaolei01@kaihong.com>

Thanks for fixing this!

Reviewed-by: Andrea della Porta <andrea.porta@suse.com>

> ---
>  drivers/pinctrl/bcm/pinctrl-brcmstb-bcm2712.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/pinctrl/bcm/pinctrl-brcmstb-bcm2712.c b/drivers/pinctrl/bcm/pinctrl-brcmstb-bcm2712.c
> index 752b78e2c0d8..1720c220cf3e 100644
> --- a/drivers/pinctrl/bcm/pinctrl-brcmstb-bcm2712.c
> +++ b/drivers/pinctrl/bcm/pinctrl-brcmstb-bcm2712.c
> @@ -510,6 +510,12 @@ static const struct brcmstb_pin_funcs bcm2712_c0_aon_gpio_pin_funcs[] = {
>  	BRCMSTB_PIN(14, bsc_m1, uart0, vc_uart0, uui, vc_spi5, arm_jtag, vc_uart2, vc_i2c3),
>  	BRCMSTB_PIN(15, ir_in, aon_fp_4sec_resetb, vc_uart0, pm_led_out, ctl_hdmi_5v, aon_pwm, aon_gpclk, _),
>  	BRCMSTB_PIN(16, aon_cpu_standbyb, gpclk0, pm_led_out, ctl_hdmi_5v, vc_pwm0, usb_pwr, aud_fs_clk0, _),
> +	BRCMSTB_PIN(32, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m0, vc_i2c0, _, _, _, _),
> +	BRCMSTB_PIN(33, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m0, vc_i2c0, _, _, _, _),
> +	BRCMSTB_PIN(34, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m1, vc_i2c4, ctl_hdmi_5v, _, _, _),
> +	BRCMSTB_PIN(35, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m1, vc_i2c4, _, _, _, _),
> +	BRCMSTB_PIN(36, avs_pmu_bsc, bsc_m2, vc_i2c5, ctl_hdmi_5v, _, _, _, _),
> +	BRCMSTB_PIN(37, avs_pmu_bsc, bsc_m2, vc_i2c5, _, _, _, _, _),
>  };
>  
>  static const struct brcmstb_pin_funcs bcm2712_c0_gpio_pin_funcs[] = {
> @@ -585,6 +591,12 @@ static const struct brcmstb_pin_funcs bcm2712_d0_aon_gpio_pin_funcs[] = {
>  	BRCMSTB_PIN(12, uart1, vc_uart2, vc_uart0, vc_spi0, usb_pwr, vc_uart2, vc_spi3, _),
>  	BRCMSTB_PIN(13, bsc_m1, vc_uart0, uui, vc_spi0, arm_jtag, vc_uart2, vc_i2c3, _),
>  	BRCMSTB_PIN(14, bsc_m1, aon_gpclk, vc_uart0, uui, vc_spi0, arm_jtag, vc_uart2, vc_i2c3),
> +	BRCMSTB_PIN(32, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m0, vc_i2c0, _, _, _, _),
> +	BRCMSTB_PIN(33, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m0, vc_i2c0, _, _, _, _),
> +	BRCMSTB_PIN(34, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m1, vc_i2c0, ctl_hdmi_5v, _, _, _),
> +	BRCMSTB_PIN(35, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m1, vc_i2c0, _, _, _, _),
> +	BRCMSTB_PIN(36, avs_pmu_bsc, bsc_m2, vc_i2c3, ctl_hdmi_5v, _, _, _, _),
> +	BRCMSTB_PIN(37, avs_pmu_bsc, bsc_m2, vc_i2c3, _, _, _, _, _),
>  };
>  
>  static const struct brcmstb_pin_funcs bcm2712_d0_gpio_pin_funcs[] = {
> -- 
> 2.34.1
> 
