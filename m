Received: from smtpdh17-1.aruba.it (smtpdh17-1.aruba.it [62.149.155.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1120849F120
	for <linux-gpio@vger.kernel.org>; Fri, 18 Sep 2026 07:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.155.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789717996; cv=none; b=g3U+L0LrjH1InxsqPYDylApTBE875vga5B6Uli3buhufOhWqswTxE8d+804+juEqfzv2L2YXx1qcBgtan4mPkvlJvddY0owqp5o1s75j9tBfWy75CXUOdlIGyVSk0v0A/4w8GpHkqsUoswtuVJZ7XzI5AdptbCNZfKZu8RutP5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789717996; c=relaxed/simple;
	bh=4y2+ZhFdCjg9e0v9XAtB+1izgIjBbJixC6kPLXMZnV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LvnwsaijCnynSt8eB6fK4ckGhLIHSCdkcYAn8vSMIKV7E84SI3BNITgPoW2CtH+PjG0eP6f2bTUUp0W7n4gzN2abZmV5Se0jt0DcMPnO4+hH/QkOVOEJOo+3ildouDDNaOKj/PgiGVfJ2Qvf+Zs3INFVFdCTln2hY+LswR0FiyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=Ooay3tPb; arc=none smtp.client-ip=62.149.155.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="Ooay3tPb"
Received: from [192.168.0.186] ([101.57.122.26])
	by Aruba SMTP with ESMTPSA
	id 7TM8xO8s9r6Qv7TM8xPQVa; Fri, 18 Sep 2026 09:50:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1789717801; bh=4y2+ZhFdCjg9e0v9XAtB+1izgIjBbJixC6kPLXMZnV8=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=Ooay3tPb2eF7PB4ABd7/AcrIjO7Z+i54rdSdi+wQ8XLX0Js+8MAqqfAXPITAEPF0V
	 pgSbDEXMNIpJzla7OeZ2R4IKMXTEVtbtZOqM1xZyFXgzFL/qgEcJsznqr7GjHYmMrV
	 z7w4CuUJL7teY+ej4k4tdMwJ04UafYW15BAnY5EmX506x94PwB2vsW5bubRNiDXYbE
	 OX/Y5rOUySJjdP+BbhQBm6sZuw4ZxDfJcw2UVOpc7/w392B3vEFu/vC8DyMN/JGU5G
	 FiBzHCPy+gEBKd8dT0NRerBXqr7Xumntqf+AxYKkgmhm0Zb5Nwc5g6aYS1IXFQNzpL
	 yKxbBGDAqUDSw==
Message-ID: <bea71814-e4e4-48a3-84e5-901d2b3a5c48@enneenne.com>
Date: Fri, 18 Sep 2026 09:50:00 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] pps: clients: gpio: propagate probe error codes
Content-Language: en-US
To: Eliav Farber <farbere@amazon.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260916182641.9768-1-farbere@amazon.com>
 <20260917075611.47881-1-farbere@amazon.com>
 <20260917075611.47881-2-farbere@amazon.com>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <20260917075611.47881-2-farbere@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCe20FSGwlBxOEtP1bnumqe76TRik6QpO4ZDmQiRUA9pclUN6lTp7vgMMSinnBRBuHcWn5XAmMG+oDiAy4MYTEFV3p/K6ATmXQ3w333iRQon9DrA8WIH
 m+zf+GaXTtPrlMc59QnHYJ6xdKE0gWuIFhVXbklh6pUNrSI1YdYa4Eo3S9e4B87ThIE1B5qtJINTzR8/ehrnaScF6IT8G/wx/mEPMiP+yvPkZxNYcVqBncM0
 d7io3yaWfmffN4Evih1Sw7EEsj7dpfMf+ILBRFCTCYX1HSt52n5cVBJfR2F5OkeBVyRZs/MQuCZOqy1hQZpWFAygrgwnYbuqQLJZVKngLZwS7ZKiIZetmnbl
 eoNStTPY/3iJ0T8bmzlfp0JkgLil4TQzB9EMxydj+qilyu1xp+Un2GfhvRArV20k4lj2QTK20hdfzE7ybw+Ciiqe0FL0Sl4OItdJkRvBbVonMuz8KuZ0md2v
 lSUfTyCVVKr00zlMyFhWZ+ZbS/tmsNLXnp/zinircgksftip8pyaNBn6y+ac7LPd0qcr0Yxts2wqqdNXsvKXPWvgkUVHT8X/A5n9Mw==

On Thu, Sep 17, 2026 at 07:56:09AM +0000, Eliav Farber wrote:
> Return the actual error code from both paths, and add the errno to the
> request_threaded_irq() failure message.
>
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> diff --git a/drivers/pps/clients/pps-gpio.c b/drivers/pps/clients/pps-gpio.c
> index 73ec2c7335e5..038c55c5f7d4 100644
> --- a/drivers/pps/clients/pps-gpio.c
> +++ b/drivers/pps/clients/pps-gpio.c
> @@ -165,7 +165,7 @@ static int pps_gpio_probe(struct platform_device *pdev)
>  	ret = gpiod_to_irq(data->gpio_pin);
>  	if (ret < 0) {
>  		dev_err(dev, "failed to map GPIO to IRQ: %d\n", ret);
> -		return -EINVAL;
> +		return ret;
>  	}
>  	data->irq = ret;
>
> @@ -197,8 +197,8 @@ static int pps_gpio_probe(struct platform_device *pdev)
>  			  data->info.name, data);
>  	if (ret) {
>  		pps_unregister_source(data->pps);
> -		dev_err(dev, "failed to acquire IRQ %d\n", data->irq);
> -		return -EINVAL;
> +		dev_err(dev, "failed to acquire IRQ %d: %d\n", data->irq, ret);
> +		return ret;
>  	}
>
>  	dev_dbg(&data->pps->dev, "Registered IRQ %d as PPS source\n",

Looks good to me.

Since this restores the -EPROBE_DEFER that gpiod_to_irq() can return,
which the hardcoded -EINVAL was turning into a permanent probe failure,
it is probably worth adding:

   Fixes: 4461d65176b4 ("pps: descriptor-based gpio")

Ciao,

Rodolfo
