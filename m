Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4881620C46F
	for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 09:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728637526; cv=none; b=goFQVUj+jqFDAJtX6Qr+ti8CPHH62kQNhQQr6be0sQnJBAPwgiHNkW3Ghmh+i3MsK0+hCkfa7YsmsA9VOZrjNnRWGN4TNqUp+FwKfglQXNwmRFIadcvb364eBouw8WZfDhn0rzoh9XBYjlzLKdrMCUagzVTJyf+Q5GE8+S8iHIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728637526; c=relaxed/simple;
	bh=1zfenuAoYF4a7geMFxuHrscRCvybiU6YmE0xZA9vtLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D3vjWwx9zaSvBkLio621ZQanTGqogsx1x8o7yWtM1sasXKbEO9SNmON4CitI0VguutupwBE7gP5z6FeHVL5SSXIkydfSuAhCqdDMUEcIXkCM5PZWW/1j4bmIS6q4zhEhfNUC6QIaElUlMBu+iJHXmlN/Yy42OqUj+Xn2+8VQNLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CoYKwZvP; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CoYKwZvP"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2facf40737eso19282491fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 02:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728637522; x=1729242322; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zfenuAoYF4a7geMFxuHrscRCvybiU6YmE0xZA9vtLM=;
        b=CoYKwZvPML1MCGEx1EtnoBS2VjwEeNRqvvfRNAE85gKF7hFgJ7DQy64uBrOMxJA5tC
         JH5X57J4gUqoN+tpuFs00qrDKO5WxLZfj6YaF07pc9iNxI7Z3l2omtSYUsDqY6zyyya0
         Twi3Fg0cmyPvQKA3urgPyFnGjeeLcziKfCkr4Ous5dwD4b98+2qPeqlVGvI6bJAeEg6h
         F3EtA+PfepgoGs+nfeH4ZEA/VqmVa8CL54SgEifuRSz06Ny7BO6tgwqV5LomlH25gHk5
         UI0N5SDW9O1jD9jBIDZp7yeOZ7BjcspNP7+p3OX5nNkEI3y4diSJxq54EtVElUIhq4ji
         7B1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728637522; x=1729242322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zfenuAoYF4a7geMFxuHrscRCvybiU6YmE0xZA9vtLM=;
        b=f/nUAznjyS66U9U3DYDCUiiBUVKnkvxSOKH43V36mVrzsdMSKiN0cSqbaWLuvRJTry
         ZzJaTNZ6dcKLeifo2tdeeLa8R17OVnuXnpJK0O/PJpSSjhwaW5cpjZGCTMjyO0C0R6mS
         zWVS1D0tQ3r2o65+p1yAYhYEhShWF1mpU1m4JKIaQkiv5++GAWjqsr4QO+L7QmQ02U7S
         LIDiFfSfDRQYjdHxZ55ZmepnpH8pCMcsT8yCxgC1RrH21IuX12fU7d80ejY+4dWrrF8/
         mrGaRF3JHYf2WBBNzdInqn0ilAOmaCHvVk5vuWl0Fj+pHvTLspO/Z8MXSG80Tek75UTt
         Xthw==
X-Gm-Message-State: AOJu0YwvSz5at2YbFPkVti9U7O1RRszPJ9jiZXIqh7Lvp95jNM299qe8
	I0mfdkLR4xkNIa2rQ+DchyepYKL+EUsF9AYZnQdu0QXEcOnx7awNsQqJKROFea4j4/cKiylG7TZ
	Yzb1RhtAFDEA125SBrWIleoIhJPIcim2ZxYF+Ag==
X-Google-Smtp-Source: AGHT+IGjIHOhmW+rkh7qdlHdrYT4/PDyvv8NnEBDaf5EvMG/zHb3OIc2wlEXGA3BRCW6RcKWaTjP3ttBjdyrkypf2sc=
X-Received: by 2002:a2e:742:0:b0:2fa:fc41:cf80 with SMTP id
 38308e7fff4ca-2fb329e8c25mr7837511fa.43.1728637522372; Fri, 11 Oct 2024
 02:05:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241007104052.39374-1-brgl@bgdev.pl>
In-Reply-To: <20241007104052.39374-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Oct 2024 11:05:11 +0200
Message-ID: <CACRpkda+g9Wu6tGhWsC9tQN8qLXogr58JAiB+tPfyJEojHXzqw@mail.gmail.com>
Subject: Re: [PATCH] gpio: ts4900: use generic device properties
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 7, 2024 at 12:40=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> There's no reason to use OF-specific variants of property getters.
> Switch to using the preferred, generic device property helpers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
