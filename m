Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A733BB112
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 13:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789477913; cv=none; b=ZgeRRgiz6KlH1qBGBOI0nAErFNqSWxJB8wsRrRBvewmlbrFyUCAOAq8SGXk0CXwdHsvWPGZD821wjlvgBZdoIOvjPSiG7n6Ip6gvdTfw3ctZip8wHqUomNV8vznjT/3opB6PpTOeV2oe9H4x71LuHCQltgxYteFhqu/WPHhPUp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789477913; c=relaxed/simple;
	bh=dJIpLG7rWyh8df7B17Ve+WIWPViliazZmnq6Gw510oU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kXLAJgR+PfgF2hvzsBMyejaSXsLpKYfln5Nd6y647IjBd0PlE7ro3Vc0zwakgGMoiMQyc/8YVuKUx77r4jMscTN7pTc6IV0sVJ/j8ZJfuf6NYq4MxPKFix4d22ywNx6XkPz6REEp1SfNJcg6G3f54Cql8ebw1GS8h7a7ZA+DbJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rV+LRg4O; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rV+LRg4O"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so15276095e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 06:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789477910; x=1790082710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eh3LDHsIzCU2/5CFMWOjBf/zXaCZZA/0hmDU111rhjw=;
        b=rV+LRg4O2RSaiIwvoddovYspkNkX46209zrY4YlBt2tF3Bbbk+R/LxeMPQbcMsyfA1
         vwANPY3UhfgKvIQ4SIlEePT2JLw/t/2bEoHm8vEbc9EO2BhMkhEpHLaZaUGXfnpWMEbh
         FFBChUMNIf7FhL+P9TKbY1NNALfCpQE0G/RwfRcBa3KhRQUj9Ewle1tdnhKWCO62Wd+o
         rYOXnc7hybGb/kbGvST49E/WK9bpZEN21fF1BEbHa8qGu3BRZBjs2HSa1iUqSayqiAPA
         OyVZU0UjooC3PX7/VgEbzVbSHHtHdmluL2e426vQ+P1Ew5/Eia+SChVJ2h8lmjcFYBDR
         6uYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789477910; x=1790082710;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eh3LDHsIzCU2/5CFMWOjBf/zXaCZZA/0hmDU111rhjw=;
        b=Qo4ElSNm1bPLJTl2kYoWgrZRjr3fZgJItso5MZGTstbqHhfbMhPnXXYIZJ5CsOYFBh
         hqf5N1faqY8kvDgTpx4o6qXnOcReuzlZHl/VropmTrzN9XhkrlfYjGFthLJ8BO0dMSm3
         /mDczxNt5YgQ/N8TUqGWUkECrkSvcqponimOzmU4xPsFas7PVUo4m44MIP6LYBUGRGXM
         PKe9+IffGPt+G9D7AqvQGuOWv3HnXjxxLCSio5FWuhC9ymejz2+WoS82sQOVKAlZ/L3f
         aYpRPbHqw6r1hKoR9DC9GzJ6M4VAcLECpgsABPdf28Yx5LITJxakbhpq58oyMUmXu2my
         w2Qg==
X-Forwarded-Encrypted: i=1; AKwUvBye3+OMToURQrfG3N3LnmEcUOWu5eiUSIk27IYj691lAsyx+eg74zgcaqos7IIT6MYkT++16TQUC7EY@vger.kernel.org
X-Gm-Message-State: AFuF++nKQFk2tNqDaJyw6dsSbkrQkn3fvt3Ctiw2zrE9OgTupdcm3uzf
	vsi+rLnxk/oHB7xTxAB13grP/jciTDuRnLEFCQ6J7I3hC0nvtkP0MpdrkXJrNMCVWqA=
X-Gm-Gg: AYBFou2wpN8UQa2DhQVyLZo/E9bxtYERCZnhq+Aa9hjyfIQU4XZiSfFcwm1oXTBrQJK
	pj3w7hlb3ToipFdgZqwT1HOI+TzoXD2l4pL8J5boUAnriXs7kVTenbBL0JCgYKxPmFTFuQ1ukJh
	KDsyiOqiRQBbPJdg3ruZdvJ+CMO0i7ZNGUxdKefYpnUdJJpY9qj9Qn0LIxTOaS/qqG9XWE9hyrs
	G4BissUyEufQX0QRhiv+zl/gQ1Exbj6TIIRaI2vPgnzZPNMXSczpBfOnUhn+Zc9FVnvaCkw9THq
	RDGDBfh5O0ctzaIHFJ/QJRjShBIBD9PXNJy5UCNKUV6TW4NRvvLo6OopmSxUY1yp0Y3C3YtTN4L
	MJORHqexLRR/c7QSU8RrxsJM84ftZuEnsDspJD5vh6FEDCgCys79hJmiBTeyCGvBthSLuIoRrgX
	qssBFe+EAnSq8mFCHpWpLQjMK7wbGDIWylRlLIiNxp1Z8O9+tNVzW7Y7eXfKXl50XTy4O+IIAaw
	3zo3C3+xyKS9ZmCbgaYLjvUlMQgKpLjHXSZddUpC6WVbFqX3lDg
X-Received: by 2002:a05:600c:81ca:b0:49e:642a:4f6f with SMTP id 5b1f17b1804b1-49e7a69ba24mr89417055e9.33.1789477909851;
        Tue, 15 Sep 2026 06:11:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:ff86:16e:fede:9407? ([2a01:e0a:106d:1080:ff86:16e:fede:9407])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7eed9d00sm58506615e9.0.2026.09.15.06.11.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 06:11:49 -0700 (PDT)
Message-ID: <0d0ee38b-8ded-480d-a586-d26b3c292427@linaro.org>
Date: Tue, 15 Sep 2026 15:11:48 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: qcom: spmi-gpio: make direction changes
 exclusive
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Yu Zhang
 <yu.zhang@oss.qualcomm.com>, linux-gpio@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260915014447.282121-1-shengchao.guo@oss.qualcomm.com>
 <20260915014447.282121-3-shengchao.guo@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260915014447.282121-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/26 03:44, Shawn Guo wrote:
> pmic_gpio_populate() seeds pad->input_enabled and pad->output_enabled from
> the hardware MODE_CTL register, so a pad left in DIGITAL_INPUT or
> DIGITAL_INPUT_OUTPUT mode by the bootloader starts out with the input
> buffer enabled.  Neither direction callback clears the opposite buffer:
> .direction_output() only packs PIN_CONFIG_LEVEL, which sets
> output_enabled, and .direction_input() only packs PIN_CONFIG_INPUT_ENABLE,
> which sets input_enabled.  Requesting either direction on such a pad
> therefore programs MODE_DIGITAL_INPUT_OUTPUT rather than the requested
> direction.
> 
> That silently breaks both directions.  After gpiod_direction_input() the
> pad keeps driving the line, since the output buffer is never disabled.
> And after gpiod_direction_output() pmic_gpio_get_direction() still reports
> GPIO_LINE_DIRECTION_IN, because it cannot tell plain input from
> input+output, which makes gpiolib consider the line an input while the
> driver is driving it.  On a board where several regulator-fixed nodes
> share one PMIC GPIO the shared GPIO proxy reads that direction back and
> rejects every consumer after the first:
> 
>    reg-fixed-voltage regulator-wcn-core-vm-1p35: setup of GPIO (default) failed: -1
>    reg-fixed-voltage regulator-wcn-core-vm-1p35: error -EPERM: can't get GPIO
> 
> Pack the opposite buffer's PIN_CONFIG_*_ENABLE along with the requested
> direction so that the resulting MODE_CTL is DIGITAL_INPUT or
> DIGITAL_OUTPUT, never both.  pmic_gpio_config_set() programs the registers
> once after walking all configs, so this stays a single register write.
> 
> Pads that are genuinely bidirectional can still be described that way
> through pinconf, which is the interface that has always been able to
> express it; the gpiolib direction callbacks now mean what gpiolib says
> they mean.
> 
> Assisted-by: LLM
> Fixes: eadff3024472 ("pinctrl: Qualcomm SPMI PMIC GPIO pin controller driver")

You should add:
Fixes: 263447532463 ("pinctrl: qcom: spmi-gpio: implement .get_direction()")

Since my change added the get_direction callback.

Personally I would prefer patch 1 instead of this change.

Neil

> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index f6dc43e27b38..eb4431591331 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -741,22 +741,26 @@ static int pmic_gpio_get_direction(struct gpio_chip *chip, unsigned pin)
>   static int pmic_gpio_direction_input(struct gpio_chip *chip, unsigned pin)
>   {
>   	struct pmic_gpio_state *state = gpiochip_get_data(chip);
> -	unsigned long config;
> +	unsigned long configs[2];
>   
> -	config = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 1);
> +	configs[0] = pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 0);
> +	configs[1] = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 1);
>   
> -	return pmic_gpio_config_set(state->ctrl, pin, &config, 1);
> +	return pmic_gpio_config_set(state->ctrl, pin, configs,
> +				    ARRAY_SIZE(configs));
>   }
>   
>   static int pmic_gpio_direction_output(struct gpio_chip *chip,
>   				      unsigned pin, int val)
>   {
>   	struct pmic_gpio_state *state = gpiochip_get_data(chip);
> -	unsigned long config;
> +	unsigned long configs[2];
>   
> -	config = pinconf_to_config_packed(PIN_CONFIG_LEVEL, val);
> +	configs[0] = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 0);
> +	configs[1] = pinconf_to_config_packed(PIN_CONFIG_LEVEL, val);
>   
> -	return pmic_gpio_config_set(state->ctrl, pin, &config, 1);
> +	return pmic_gpio_config_set(state->ctrl, pin, configs,
> +				    ARRAY_SIZE(configs));
>   }
>   
>   static int pmic_gpio_get(struct gpio_chip *chip, unsigned pin)

