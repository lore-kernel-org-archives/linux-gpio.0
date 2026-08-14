Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0614B3E6DF7
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 08:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786694671; cv=none; b=oLISOuCNEW6pqSqM3eysmLbAfvqbpV85y1kP18NVTIV0L33UxAEL6q1G4ve/GE0zBYQ+vr0ibenqhuO7Pq+jfuLtOmBK+W87+xCz58SwmvUTLdSOlWUHHX1echvfJU8sQCtfuE+0qbknOpQrjKMhI661lrUQCdC6qSJy/jHryYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786694671; c=relaxed/simple;
	bh=4GtjVz8aSkcV8b91bhUSgFtXdsgsr8VDTaF8d3s/S3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mApzkaXiAA/3agLKPeU7bBmX/ZNeqKPu5+Y0YYS6QAgWp6SNbW/x/vcxzafa+9vxuAa1oLO4EJOBu7J1k/5C0B8ax+dAO5b+xBwsG1Er1/wCca1oOZV5NLdPijuB5t4BnaYuKK4x3Orjlw5I0ZdIO/YiM5zXCXo8Sc/NxO16edc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EgDCmVTd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EgDCmVTd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD16D1F00ADB
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 08:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786694669;
	bh=4GtjVz8aSkcV8b91bhUSgFtXdsgsr8VDTaF8d3s/S3I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EgDCmVTd+nFlCcoWLX1CowPzRJTPj7xD/6ijFoL0MQqHLVeKRF4A2fli3yami7BR2
	 Sr6IdOjib8bFJxzomPosLHtV0EYwbHi9MQnMr9PR1MttWcAkcf3Q+gF3U/0BRAzUNN
	 +9SJifjUswN2fD0lS3lc7O3vjhfnKL9j7sChv2jU+sn8gOhx40en2EaWXobpBrEIku
	 L0Vpz3hYnkLxu3Lv8Zvt2w/RhHNtG8VXcZG4YE1gkdj8krbwCUNd4OibMXhYWA7IIN
	 n1hsCeIQNpLFlLGor9T6MNwh5cnm0waDTQ+Dg+3EmyyTseHUVHQMx/LbWJqdNuVv/+
	 regfGSWNlzsYg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b011edaf7dso740486e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 01:04:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoBK2AOq5nPdfQRkodg1V7Bwa4ye+qBuhzHGO3liN+fQSH/ofqKdQL3PAvfyuIIzOKEgKYV5JgRv/4R@vger.kernel.org
X-Gm-Message-State: AOJu0YwrXIIjoiWMPV89GS+TIcoP7KyS9HQjzjfuUgQWWdCAf0r/0DKG
	rKXwOAv3SjCrV1Dv4+8hrYKgeu72ezrFxVOOxaTICXD4pNwkGGSCCaW4lO6CMA8BeacnDaI1Kxr
	mGQ2OhFdXYHZQ5GQ7zSeAwxlC0pJy7U4=
X-Received: by 2002:a05:6512:ac4:b0:5ae:bc40:46de with SMTP id
 2adb3069b0e04-5b4591a3437mr500240e87.54.1786694668515; Fri, 14 Aug 2026
 01:04:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812-sync_a4-v1-1-b7279c26e2bc@amlogic.com>
In-Reply-To: <20260812-sync_a4-v1-1-b7279c26e2bc@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 14 Aug 2026 10:04:16 +0200
X-Gmail-Original-Message-ID: <CAD++jLm=bW+fFgwjYjUyKAenY-QkxZQxrRcYQKfank-ZNcVr2Q@mail.gmail.com>
X-Gm-Features: AcwNN1UyDExcAOXw8J37R-EEDNTfffTGz3BzYB-AtaE8hWwAMb7QYzUfCwaWE8Y
Message-ID: <CAD++jLm=bW+fFgwjYjUyKAenY-QkxZQxrRcYQKfank-ZNcVr2Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: sync some modify from A4
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 12:22=E2=80=AFPM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> Set the drive strength before enabling the output to avoid enabling
> the output with an unintended drive strength.
>
> Also return the actual output enable state from
> PIN_CONFIG_OUTPUT_ENABLE instead of always reporting it as enabled.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Applied this patch as well.

Yours,
Linus Walleij
