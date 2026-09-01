Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5763948876E
	for <linux-gpio@vger.kernel.org>; Tue,  1 Sep 2026 17:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788283379; cv=none; b=tMmHR0ZDDZNRiQZBr8pPuowz2JYiKbq3BeaXR+5ZwLMfQD32YPkWxSsss+pK0OwYaTRV69Y9uWlKldfFpmWVYkWAoxcZ1nxTqH2KkeMMWut+TmMB0WqM9se/+nJGOKdnl4uZ8DRRQVkoTJl1k4wpQT/MAcw2vpB41plwPzEan2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788283379; c=relaxed/simple;
	bh=Ad1DukBGwLi6ArucFKVFRHpCwR2Weby1EPL9ATOHJ1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cMea1NsErB4623ixY2SmgLDJz3VcSwIf1mgkyBvOjlB7OJSajn5LJni1ij4GhyR+NcC09yLL/6ys2sqTXLdk7mJTNazdmpXSVm+vR02E+d6jvTxt4X5a2BHXaocoWGwe4gKd+8uP79Avw+MasiTXdTZWs4wZo6GdcLoI2TJAOxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hLT6pqk/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hLT6pqk/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C021F00ADF
	for <linux-gpio@vger.kernel.org>; Tue,  1 Sep 2026 17:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788283377;
	bh=Ad1DukBGwLi6ArucFKVFRHpCwR2Weby1EPL9ATOHJ1c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hLT6pqk/N3t4GsJHKh6IsbFpP3/hTTyorJFTxXTtgNJXA6dBXcp/OsAr/8n8udXL2
	 yPmUjPQnbS7tthwscVDgkBq0SpjosQzqiNizqvhoNY9oQT6oPiGLUAcgp7cbmnMb3Q
	 FzZjM3JzC2jleBf4G97WdhXulwnZuZrKjMpUOQMSv3N39ayy9KVor+RQs1iQnnZkF8
	 A2NkG8MKPzXB6EiPADiumEzl35X73acZNA96sFjXu35zszn+mHIm/2C9zB1BIGnDfN
	 YrQ1HzKChXi0MGA2X3ERbmr4r2zuBI2tFkW6LwhYtie1Ygd6J8oea2NX2at8grVpE8
	 bZuBEPcgIAgnw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b6031cbc6bso796973e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 10:22:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByGq2wvoFFw1GjNgGRhHaY6273BtvSlawLAER5+cpyr45/nfWWF7vZ07QNunQ8WJbgLrtVaS/Y5/Odo@vger.kernel.org
X-Gm-Message-State: AFuF++kI3rR0MYZ7wbig7HuaNLMzuqJG8BA/GPnEgmYV584IqsySV+Uo
	4kekcKocpTGL3Nyv/DZvhR7sH0RL4y8A/7D5lvpQEPtDjaubnyj8Ui73b8yrNOuyNacFuPTin+6
	spCRzx/8Pynz6hRJ8146U32qDijkIzRQ=
X-Received: by 2002:a05:6512:ac7:b0:5ae:b998:9134 with SMTP id
 2adb3069b0e04-5b5e68a7adfmr11827743e87.1.1788283375630; Tue, 01 Sep 2026
 10:22:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com> <20260827-kuno-soc-support-v5-9-6d47636a8f09@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-9-6d47636a8f09@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 1 Sep 2026 19:22:42 +0200
X-Gmail-Original-Message-ID: <CAD++jLnHCrhvdVCzbU5JA1qVOQ7hh7B=gwPr9QPtZdqh9ZxADw@mail.gmail.com>
X-Gm-Features: AcwNN1V_scX2qdh9lKw1huy2nxRfP13bn5JqOZZxyJX3f5glJ69SIw1ECTFLPMk
Message-ID: <CAD++jLnHCrhvdVCzbU5JA1qVOQ7hh7B=gwPr9QPtZdqh9ZxADw@mail.gmail.com>
Subject: Re: [PATCH v5 09/15] pinctrl: qcom: Add Kuno pinctrl driver
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Georgi Djakov <djakov@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>, 
	Guru Das Srinagesh <linux@gurudas.dev>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 7:52=E2=80=AFPM Hardeep Sharma
<hardeep.sharma@oss.qualcomm.com> wrote:

> Add the TLMM pinctrl driver for the Qualcomm Kuno platform, supporting
> 110 GPIOs and their pin multiplexing, pin configuration and gpiolib
> interface through the common pinctrl-msm driver.
>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

FWIW LGTM
Reviewed-by: Linus Walleij <linusw@kernel.org>

Bartosz will decide and merge when it is ready.

Yours,
Linus Walleij
