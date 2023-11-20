Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MS4SPydT"
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D55310F0;
	Mon, 20 Nov 2023 06:02:30 -0800 (PST)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-677fb277b7cso12068236d6.3;
        Mon, 20 Nov 2023 06:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700488949; x=1701093749; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SW5H6+GFrLZpuAg2kGT9GqVc35788MqwtA8XYVGcezU=;
        b=MS4SPydTxdqqJAZZHQ6IWh9sd4oaL6USu5Y318QtCqVfniYI2uM8eIfi0AZxavwMk2
         l5SvoJd4cp/94S+TPIOyHX0fxLa1ewRDouGFZvgs3XhYiHXwyV9pZJx+DGgMCfCmPnCe
         VNvhRJZcAjwTyOwnuYituQdQnwBlUrdHLVMDkENEVwXrcKBTi5OQVxQwYojRU5DR5SjR
         f9Sf91z56pgDadONXm+Zc9k/er7ge7V14WNRVrr2R8dcbEqwafk6y9WV0ZKsJWRnznbg
         QLV1XRqHSUIM0WsVnrWvUjR3zSiCPEiJ90WUFngZrHLs3NikDvsRgJGauO4KfimEEQLa
         QZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700488949; x=1701093749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SW5H6+GFrLZpuAg2kGT9GqVc35788MqwtA8XYVGcezU=;
        b=fyiPIbcTj07xpiG32D96VTvF0cTlNlWbv+4Q/i01SmsUoH6BiwAT79KbZ7kiXJn5FF
         Qr9Ss6Ia6G2EuAGwDJHftWDhSAnbN3lZ5zKxTRPVGKUlwzOa9dSKbYoAJMMGG5NL66Wi
         qqr8EkC9icTEJA6MWe5W4Zqp4hkRzQYGezetbbIhXDuEr9tP4YSlUXv2M0Z73v3rrBbK
         uMgR3kogSJ8agpN+k4bqWRl2DEer/sVgIwdOw47+gKAhfSgSgx73P7cL97fBztQyFwJT
         DILjPm0BeVtWf4XihunrT6lCrsv8E8xDJPIoCWKrGJqHEpSSu84mD54iInWNXrZOUjSZ
         qBsw==
X-Gm-Message-State: AOJu0YwxVjZbHFNCr/rxOO6dKf2qP80uD99IZnp88U9UGf2HhI0G90YF
	yqkB1W5yeFFf+0j+eoqg1SYUS8ujs5Rkg0HJ2Yc=
X-Google-Smtp-Source: AGHT+IGeSrnoTC16ZLCmpmUVs/JOx3P+70UOzoWmnEnwoTuS02z1pZ2tcccL8OodBdGDyRMLzrT1lmoHfF8FywLQpaA=
X-Received: by 2002:ad4:5de6:0:b0:673:7256:7c70 with SMTP id
 jn6-20020ad45de6000000b0067372567c70mr10262221qvb.38.1700488948995; Mon, 20
 Nov 2023 06:02:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231116223045.274211-1-afd@ti.com>
In-Reply-To: <20231116223045.274211-1-afd@ti.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 20 Nov 2023 16:01:52 +0200
Message-ID: <CAHp75Vcdr9yvCXBBU1R-PQ1K8B8U6YRtXQgz_hZfENtMgr6OfA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: as3722: Use devm_gpiochip_add_data() to simplify
 remove path
To: Andrew Davis <afd@ti.com>
Cc: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2023 at 12:30=E2=80=AFAM Andrew Davis <afd@ti.com> wrote:
>
> Use devm version of gpiochip add function to handle removal for us.

LGTM,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Consider adding a new patch to convert to use return dev_err_probe(...);

--=20
With Best Regards,
Andy Shevchenko
