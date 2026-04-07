Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94E030DEA6
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 07:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775545371; cv=none; b=Q7H0QzlfImXFT2LIrZjfhG8yXPCNkKYZIBFIoWIvbesDTFK3HdoiW/LEc/diUpi/PImHnp70v371GicfYi4vhBYrecNNhe3GxwEWVb0jILm8vGqGtdUlVNMv5ja5ofum3HdNpoAo0FMyQ21Fu/K0H1ZnzJeMzIxTxVNE9LNrYi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775545371; c=relaxed/simple;
	bh=LUMUfngw5BmR4+GVbeaTttcxyJo2/uhE4b2TZgq/zj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h6XoM5UN25wc+Nrgz+fRLGcU6B3s/Uex73vBDvQXhaleRhd6+e3dxL/bwVfh0gQfLpHYLY0cc0ypWd6nZAl2B2n0Wng9bFIJ+pOMADT0967krAG6whp6sI1FPG+f8zJI6KA+tewv5lYkJnL1LAAHLWgSy9Qb3E3gi3pKEKDRVms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aj5esGEa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aj5esGEa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93156C4AF0B
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 07:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775545371;
	bh=LUMUfngw5BmR4+GVbeaTttcxyJo2/uhE4b2TZgq/zj8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Aj5esGEaJglc37W1ozidj6mAqq9Jcw1/T0LsYfZFMGjNlNAHMIdF0bM6QB/DtkUft
	 4IX/wtgeIownk0iIlX11Ddb/frnjbgjLROp0cghf95l0exOuV/iNbm5gnpWWChyW2z
	 dHe/UTuWk7tl0zyVNt9fbwO5aFQtcgTmAxrjM9L6gz+b/poQohZkKeYF1dLI5uPCzw
	 opicr56heMZNbC49J3Q83WGepCqBRBgju/ruzFg7xSpL5IRGXxPZcR7wke18ex/UUk
	 n+jGLQ936GZEZbj8Kzym7UkIQAJwrQBN4sjSnrPJ4ywVH/XRELCtawnA9lSwKZTNda
	 YBAUGWg/f+m1g==
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6501c4857b2so2296310d50.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 00:02:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXPiHTrsdcaa/j0mlGGZ3f9w+EhvTV0v8TRnqmLk+jKUzE4HHFQJ3vHDZogHzJvfIuh7JNNJUEv4/4g@vger.kernel.org
X-Gm-Message-State: AOJu0YwKGLHJ9UgOHD3q//EkhxDG3MF4Z3VW6clLAgxBzpofsTOmzCnh
	pqItE2gSJjn5WbOhqQirJ139SooBJVj4ABmWfuvaCKRwLxuOJEhj14Eenk6I33L0xSA0aJ6x0Sh
	uTH3PeWdFszTZGTdmgYdpAh+hNc9r6Jg=
X-Received: by 2002:a05:690e:138a:b0:650:4a79:f3db with SMTP id
 956f58d0204a3-6504a79fcf0mr14778469d50.51.1775545370947; Tue, 07 Apr 2026
 00:02:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331200658.1306-1-mailingradian@gmail.com>
In-Reply-To: <20260331200658.1306-1-mailingradian@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 7 Apr 2026 09:02:39 +0200
X-Gmail-Original-Message-ID: <CAD++jL=0LvdaYVTrDGiCiPE=qZWzBpH5ZCNH9N28wBLOy-981A@mail.gmail.com>
X-Gm-Features: AQROBzDlAy5pLG3p0JqXUGeo80M2oiwNZ2fWncgiphyWDpp5mb6TpMvRT7vecLA
Message-ID: <CAD++jL=0LvdaYVTrDGiCiPE=qZWzBpH5ZCNH9N28wBLOy-981A@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] SDM670 LPASS LPI pin controller support
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 10:06=E2=80=AFPM Richard Acayan <mailingradian@gmai=
l.com> wrote:

> Richard Acayan (4):
>   dt-bindings: qcom: lpass-lpi-common: add reserved GPIOs property
>   dt-bindings: pinctrl: qcom: Add SDM670 LPASS LPI pinctrl
>   pinctrl: qcom: add sdm670 lpi tlmm

These three patches applied to the pinctrl tree for v7.1

>   arm64: dts: qcom: sdm670: add lpi pinctrl

Please funnel this patch through the SoC tree!

Yours,
Linus Walleij
