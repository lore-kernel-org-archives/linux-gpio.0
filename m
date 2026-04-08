Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4CA39BFF2
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 08:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775635825; cv=none; b=fsKn76RIzF1VM+qre15/GUvOJm0TAwntr9dJjODPM0GY6TSflV3wBL39PZbkn8BEQRaDLYL2jR/6uaLQs3YNR1OYsdyJCjqTfCfRyA3VLWv3UBG8cABwrwrJH2YRstK6OKygsOGPhqGdUfNYrgq7tYigBabGM/OlhWEiCW/4RsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775635825; c=relaxed/simple;
	bh=ECHfPTPhmkdkFd66BtjTzlwbUq3yiTD8+y8hVdw2RfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dgaxfu9CjLb5OYBXK+TFc2d4Hk+52XVKXEGKaJ+iUoGcpDvQClx6mNgNxuI1mnLgnxweKTB6oFsEbp2qyjCQk3xuvUmaE4ydMFYTlqEQODWxM5BMlFLNEuW0VM0xepDi1ryvaWnJeKdQwrKPj+26IGjuohxBQACpz9ckeUb6s7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mnwDaxLU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mnwDaxLU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB0B8C2BCB9
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 08:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775635825;
	bh=ECHfPTPhmkdkFd66BtjTzlwbUq3yiTD8+y8hVdw2RfY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mnwDaxLUEvi6SZPn1O2Jxz9UkOGmiLuT1x7dy5qF8I+4etmgxoNGRT95vOx9sU4ax
	 utrC7yMuE75rRS1L3ZgdBGqzITEQTAPLqNIHFHivuEYErZ50djnryQoPoeoRJ+5uPq
	 2WqWYT259QOAveYplN36YuPl1ZLlz3qNpnSrwc+BbUK0JSnAjPcLW0drqSz7e+1+SJ
	 kp/uDRWjn4tUHiIz/ZXzb+0Y4zB3JkiyPsqX01N3YAdaE+/XzT9qSdUHRubzcZMAcd
	 1jKyrdck+UVjLGGHxkNo2biL72hvGB0kLnenGdht8N46LC1H4l4NTUH56HW7J+VPjU
	 FemDu4ZyUpqOQ==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79853c0f5b9so94753687b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 01:10:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWrjuvzEbz03FUluweu/zwSQA52FyzMqdvYtrQ4PYvpQLAlvca2pk2yPtUX8yW60oIoZZfKbS1glXJU@vger.kernel.org
X-Gm-Message-State: AOJu0YxWd1wbzb2OfEZLUx7cisypjChjTqe1Wtwbyab0CxvpYWN8RC7i
	c/lO7Iyjzo5H4XkxryiVvv75sbpo70zB1EFBN6HEKESVlQeMmpGjURCFVt1SuhwFQc0p4lz7cJl
	KcgwN4/ajskLEdA4Z8MCceDQDwsYbEPM=
X-Received: by 2002:a81:8a05:0:b0:79f:b903:88c8 with SMTP id
 00721157ae682-7a4d3dc8967mr153186747b3.18.1775635824304; Wed, 08 Apr 2026
 01:10:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com> <20260401-waveshare-dsi-touch-v1-10-5e9119b5a014@oss.qualcomm.com>
In-Reply-To: <20260401-waveshare-dsi-touch-v1-10-5e9119b5a014@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 8 Apr 2026 10:10:13 +0200
X-Gmail-Original-Message-ID: <CAD++jLmG_y2dunkyzH7KDtphN6WORzt87f5CpqzAtCUtALv8CA@mail.gmail.com>
X-Gm-Features: AQROBzA1L-k3CYGiASnMrssM2dYaCBEXqtHZxkZ8TG5qef9N3AQG7wAPZBWfSaI
Message-ID: <CAD++jLmG_y2dunkyzH7KDtphN6WORzt87f5CpqzAtCUtALv8CA@mail.gmail.com>
Subject: Re: [PATCH 10/19] drm/panel: himax-hx8394: support Waveshare DSI panels
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Cong Yang <yangcong5@huaqin.corp-partner.google.com>, Ondrej Jirman <megi@xff.cz>, 
	Javier Martinez Canillas <javierm@redhat.com>, Jagan Teki <jagan@edgeble.ai>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 9:27=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Enable support for Waveshare 5.0" and 5.5" DSI TOUCH-A panels.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

This looks excellent, good documentation and references to (incomplete...)
datasheet. Maybe this datasheet has the defs I was complaining about
in the other patch?
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
