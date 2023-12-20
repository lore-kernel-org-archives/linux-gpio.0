Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80E4225CE
	for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2023 12:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J+jleEFa"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5e840338607so8226877b3.2
        for <linux-gpio@vger.kernel.org>; Wed, 20 Dec 2023 04:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703073808; x=1703678608; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x7KfOLNy/6GgxQnOTO2g/ZHm1XcTVDhhqMNRL/JKAVw=;
        b=J+jleEFaZ6TIYclD4PQOIonnZfXEK9Z6C0TiPvJNcSQRI+8ms5SSkbxuJtokLOlU0J
         wPuc41fX+a+GuYgChrBgFtHZRF6oL0/ZVkLFgYY8tFyUaaPyDufzHCE+JEtzLQtOg78K
         xph9bb60P/YABo9S1AyP2ZDTophdOuPSFitu0NEGXQjD4nCBL2VxdWXSHkB6MJghGBT9
         lrH51I05tvOjEp+OdL+a+EEI4/5oyymUxE51eoGNdvUxMP7qSPrarR+R02O+ekf+IILJ
         nhSoL9iAt8grP85ioexxWq89TT/jKio9Bfmf/V1XH3GxyNq5uk4uTddu4iHfqTgAxlfv
         rvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703073808; x=1703678608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x7KfOLNy/6GgxQnOTO2g/ZHm1XcTVDhhqMNRL/JKAVw=;
        b=HV/Lk8NqwS43KLCiynETDufdis1V1NuHdya4vvW5x8QRgzunH3XMpwdOkXahZXwvHH
         rFtVVey+A9sHvgbuku3lepqDEZmNSzVhHzZW4LNRwfIr46ZHZpl0s9fUNyIivSXEjM7H
         PACyngnsAJjKCnRlishwbOk8s7CWzUxD27/hyEwqgt8SWyAUbeJrsWMJ1Bz/1kxGlhPB
         IPCLqHX1QJuAVgRmhwmOa26qVsdQtr+n64DNXmGbMzKa8Y94GAm7e5LQWHlrMecBBKFt
         ujPB/uV+9scjWWXqowtOvHhQJZxNp8Cu4E31kuY/y9cqLBv0dGcF+C7ks2HSJgZLnS6H
         0AIQ==
X-Gm-Message-State: AOJu0YzuERgehmzNHbWcYphHawPCTwJEJKzsPnwQBg5P/49iSKALQjvB
	ux3yxgT+0aEmesnjSuiKVttglgj99Oa/jzM33K5N4YYwpqP9TIhv
X-Google-Smtp-Source: AGHT+IHq226PV5Y6ea/o/Mqcbuu6CEww47a289jWoxU6UrTvZHZpqreR8lMz60qHcyTdLKhizbHRBA23IMXeAcTadSQ=
X-Received: by 2002:a0d:ddce:0:b0:5e7:7c40:eb1b with SMTP id
 g197-20020a0dddce000000b005e77c40eb1bmr1775193ywe.31.1703073807813; Wed, 20
 Dec 2023 04:03:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231219125120.4028862-1-patrick.rudolph@9elements.com>
In-Reply-To: <20231219125120.4028862-1-patrick.rudolph@9elements.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Dec 2023 13:03:16 +0100
Message-ID: <CACRpkdZAYbY6Uk6mVdeQRKOWkO3R9RNs=Tdj1KFE6D7stiEEzQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: cy8c95x0: Fix typo
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: naresh.solanki@9elements.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 1:51=E2=80=AFPM Patrick Rudolph
<patrick.rudolph@9elements.com> wrote:

> Fix typo to make pinctrl-cy8c95x compile again.
>
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>

Given that the code doesn't even compile I just applied all three
patches as fixe for current.

Yours,
Linus Walleij
