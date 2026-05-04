Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8FC3D6480
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 12:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777898739; cv=none; b=GCHnGR8Ns2fl5uB8qtzvOH12EYTQJnMnX/mEO3oK9u+5ZZAJxhLfRv6Q96Dlw5ozxvbJDmb9TcqqcuBdUt0BIGFVvRCnrFD5GuqUqcO4pZMv+2IUR/J5cGE4gjX9T/Anj1JhrDWfvGuP2cxN2/t9DQkzPUXg4LEVbWjpRLM2RpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777898739; c=relaxed/simple;
	bh=OBOM5lN6joMcVQ4xEBCsFUuSvHpYYY6DnkkxBp56Ez8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kqe0sefWfM8Baan4OKG4p86jDUTYceyjGMmwSL+xlxYhkpzAELU554oIUC0Sop3RuS8BgOYMmqRzU9542aVZgXuYnbsGjQeEFqB2FNyBIrHv8kzAW9/XdvNSdYJR04IJMBZDA3InxDxxKpIZ7WGGctMPaFh4DNl3/FcftrQtkiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KfVRpWfL; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KfVRpWfL"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so28056405e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 05:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777898734; x=1778503534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k4XooOdx8Ic6o/E11H6VoiW3K4xf6ETsGRXYl00l7s4=;
        b=KfVRpWfLy1Wlfx7eedtKIvJYD4H9EjjQTpdhjPKQ7GK+11AAAFJEOJ/27Q6RhP11sX
         sluiVkZ/L+OuJVdGDqdypjbS10McdZy/tPfIPWmQNTg9a/H+2o6woxwa6QPqIjx3m7bS
         xo3K4nelkUeDliE9kL4GU0q3DSO9wNN4tOvfXzOfltwduuOFz9evMKe3DOgJOQ3Zie3v
         KFE/OZymAHu9FCo9ptoc+acPqNyIdRYmWSsXBFo08Ffb9zYGet2TnNY3AyIGYUPYe2iR
         5RqhPUn5IlOusD8vrn0Z7euYENR55o5JBHdxQ+ePUILl/waruS15HhC+hWeVl9IWX6Hy
         HeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777898734; x=1778503534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k4XooOdx8Ic6o/E11H6VoiW3K4xf6ETsGRXYl00l7s4=;
        b=lKYKS+3lfmRrfFmUNSH2q7RTzm3uqSLwXMOazk/KJJD01AWJTSzqpAsL03XyKySxet
         142Q3pCo6OtdCKGUqhtpQj6Ki7oJKXv1suB+t2xnImPUr6cZG9Qgf74JdNlDRt9RbYIz
         CES8wI/llFZPpQ/NLajMr5QVhHcX2RJ9AOVzi98fGLCXSPcUltTwSfANVPmBHzEJ5M7t
         WgqFfSrykQv+hHxhvyCCKuihdq7jTKLG036NOQVX8wTL5pskf4+gBNlAq0tJvJOV7iZt
         kPibRlLNyv2zkMOhvLjgj71KoHG0m+XggJF56DN0gQu4I0eNqgN6iet/ZAdk+jpGizG7
         sp1w==
X-Gm-Message-State: AOJu0Yw7Ag//8kN+19BneudKeRnEOgmu4p9XH3PVUG97Ly6/KkzccUl7
	+tDqjwJRc2WBW0WfNt7SgLwkFdXAbsnh+vve8ebHgS1RxoxGV+qSCR+qjBrCiiPn
X-Gm-Gg: AeBDiesfN1Xygwup+1xy208ZGMRY39yfpQXPnDNwX22q6B99BgSITAl82jp/9TtfbA7
	pHW8ZSwFLeebk+KMd6GfBPt6jY2MMtrjsKkNUzDoA0V9+xVP+8eyin1Zg9MQF8Gwlq7EQ3ZYrru
	LSBEe4pukd9UfiP3T/jJeh9sup9f9KS3etl+0fDWtO9cPbArTJ8tqFWQ68vna098mjwruFmZH0r
	mKOtRNysW+iPb8HTf7noAqUoOUh6loM5d+mnaO+4vQdHukleSOXu3sTkG7gKpDivTNyiT+Y/wCq
	0Z+Z7jkF+Pl6/EVUgSivgIh2N0+2z9sDkCVmfcTU0FJEuiH8MMoK8/KlyVZfzjrMMogc0Hj3OIl
	rzNxHp9cN7yOoHaL5Vdp/ZdHtBP0ETE004DkMBEWldPZnNq3/t3oxMUS6WBPrxCkLYK0FRvv74S
	LlHuB/l3SzNP9iSTYe3WnWwFt2gBrEzUixCt+qN239USYc5WB1srmUzh65bMwexKNdun02q+wjX
	Eo=
X-Received: by 2002:a05:600c:46ca:b0:489:1d7a:4537 with SMTP id 5b1f17b1804b1-48a97098a3bmr151655045e9.3.1777898733810;
        Mon, 04 May 2026 05:45:33 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fe92b3asm91140665e9.4.2026.05.04.05.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 05:45:33 -0700 (PDT)
Date: Mon, 4 May 2026 13:45:32 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Zhang Xiaolei <zxl434815272@gmail.com>
Cc: linux-gpio@vger.kernel.org, brgl@kernel.org, warthog618@gmail.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] tools: gpio: use strscpy() for consumer name
Message-ID: <20260504134532.0438e390@pumpkin>
In-Reply-To: <20260504075036.12190-1-zxl434815272@gmail.com>
References: <20260503190016.13439-1-zxl434815272@gmail.com>
	<20260504075036.12190-1-zxl434815272@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  4 May 2026 15:50:34 +0800
Zhang Xiaolei <zxl434815272@gmail.com> wrote:

> Replace strcpy() with strscpy() to avoid potential buffer overflow
> when copying the consumer string.

You ought to run code before submitting patches.
This wasn't even compiled.

-- David

> 
> Signed-off-by: Zhang Xiaolei <zxl434815272@gmail.com>
> ---
>  tools/gpio/gpio-utils.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/gpio/gpio-utils.c b/tools/gpio/gpio-utils.c
> index 4096bcd511d1..176bccfcccb0 100644
> --- a/tools/gpio/gpio-utils.c
> +++ b/tools/gpio/gpio-utils.c
> @@ -82,7 +82,7 @@ int gpiotools_request_line(const char *device_name, unsigned int *lines,
>  		req.offsets[i] = lines[i];
>  
>  	req.config = *config;
> -	strcpy(req.consumer, consumer);
> +	strcpy(req.consumer, consumer, sizeof(req.consumer));
>  	req.num_lines = num_lines;
>  
>  	ret = ioctl(fd, GPIO_V2_GET_LINE_IOCTL, &req);

