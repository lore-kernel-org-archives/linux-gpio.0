Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371917;
	b=AByIiYdA07q591r+yB2bbJfpsnHQRPg39iIz1QF/0sT93+nyKzW1YG469/VZ0W9aqhvy
	 u00GKmgJseyS5KbEL68Vb4eGVM8AnSEbOmRlBcBQBjgp47GJ5hTsWqTtANu3SK/qv3VV+
	 RXATmnXyXQfLACuXUEgdvGK1ZBTIQFusBlDAJPE+oIn3rjlgRehTnYI2AKCuKyTk3KeTg
	 mllkVTn0/E2YbgZUMgZ/rSITKNnaWrAJWE4oLS0x7pvqsDdw2ovGEMkkSrOcLWSY/2EU5
	 LTuZRjCSBG9VpSPmNDgL/ccy/U5Sg+3zqGNjoG2p73KBUkvM0MtL+EnGXbeYgPV7kDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371917;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1lgSvXfM1NpguQppsGiqChdK8jo6yWYjCTv/SuCYsSU=;
	b=XXrrAvwYkiL9SPt9fzcC3OgBD3XIb8pzOi87r51aknyNjQVqPIZKLlSpA5/65Mw5mTjC
	 YHM4GhQgXZttk54CQ4d2IIIGgUVrtNH2iwjKB8Kw9yVfExJXd3eV2d9B9Iyk8mIN8Ey9f
	 CE29P5ZOWwUVAjTe+ZfPgDPXmZxpEs93pY8POohZa2EhR5vC2EBUNXFNkptBPitjSzkzk
	 HASzHk1jzU4k4z4/SZeCRLDgPhGcz1fE6UBOg0+W2mDUiiDpitO54NN+uqmtqFhsqJCkd
	 TR/BVS2aVVq57WSKPo2QxBUM9pob9WbLNXEoNS8Xux5hqUt7LwxzSb/A5xKXcSvttAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EQqwl5KL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F095606A32A
	for <linux-gpio@vger.kernel.org>; Sun, 22 Nov 2026 18:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EQqwl5KL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6751F000C6
	for <linux-gpio@vger.kernel.org>; Sun, 22 Nov 2026 18:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795371916;
	bh=1lgSvXfM1NpguQppsGiqChdK8jo6yWYjCTv/SuCYsSU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EQqwl5KLh9FgRgQqiZx1o9UPuVtiNY8FZnvmw/+tZVSFTK37mS04CnXsS9fAmXWuB
	 7It1be4gsmVswbDkShAfAJV8e2zCcfiiQPP2Tk+bLn0rXeUcv2TJEZcRTHGAGA2nQy
	 ZUnIpzPIzZEIVvwP4gFFE5gntn/gXfy3Vhl9nLOYL/FLzt2QwKmsmugVwVDIp1M5sO
	 Hm5KxLw2E+e6baRWkfcJ3+DQKDZLC3+/RXLXMX5aTRW3jQ9cZrQGQCXSSDLeXHopyw
	 ZIHq8mxHQCPmlk2C2T5Szd4UZUZbGO6jRRAssA2O/ZErO+IgeU3mIQiwDQWl1g5N0Z
	 r9VU2Qe/AHHRA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ae2ab35d82so19656761fa.0
        for <linux-gpio@vger.kernel.org>; Sun, 22 Nov 2026 10:25:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEqiHqIroGiIe5IN86b+ZHubyqiOSqPVKFULidhy8tASLTVwZtUNTKaDd9r0aUPIR7joqyuVYq1sy6O@vger.kernel.org
X-Gm-Message-State: APuU4Z/tGWu9OwNC+GfeM6gMB1Op9sFzr9+igtR6UwciFt5mQqmkTh9E
	VxucwzNlsYsxPqt9huKlU+Km1IaInCMFEs2Vy+FVJM0MVSw4jmw9UPUmfUU+UiDwPKmEXrFnrqP
	JkLVMtkEzxSd8Z8T7Dcq0x8FgIwFDTV0=
X-Received: by 2002:a05:6512:32d5:b0:5bf:ce24:242d with SMTP id
 2adb3069b0e04-5c1bc806edcmr2509874e87.35.1795371915162; Sun, 22 Nov 2026
 10:25:15 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-cs75xx-gpio-v5-0-8d14f2bb614b@gmail.com> <20261119-cs75xx-gpio-v5-1-8d14f2bb614b@gmail.com>
In-Reply-To: <20261119-cs75xx-gpio-v5-1-8d14f2bb614b@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 22 Nov 2026 19:25:00 +0100
X-Gmail-Original-Message-ID: <CAD++jLkLX_d9cFLOvnXs84_9j5JvwU-ab8mpKt98x2CjTBnb=w@mail.gmail.com>
X-Gm-Features: Aa3M54oX6RtYUEXPEftHEAaE8uR74PWqSa96JlgekCMpzJ1oVnJWKeD0gq7KO7I
Message-ID: <CAD++jLkLX_d9cFLOvnXs84_9j5JvwU-ab8mpKt98x2CjTBnb=w@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: gpio: Add Cortina Systems CS7542 GPIO controller
To: filipp.dunsky@gmail.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 12:03=E2=80=AFPM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> The Cortina Systems CS75xx SoCs have five banks of 32 GPIO lines. Each
> pin is shared between a GPIO line and a peripheral function; the pin
> mux lives in the global control block and is not described here.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
