Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7270E3B7B61
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 11:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773142027; cv=none; b=GjhuK6AAJ7WVEIGGGMPweeLhf1ADcub24NJpQDMlokE6j7LInzvgoyzxjBLpN5CUUt6xfZh9dzO5xeXoxiI8ZNeKTJOztGZQnQOYoAMJTRUvMpAjeubgMd/oe7MA/6GTCwm3PG7tY0m/PtctKY5AdRYP+xYAGj5+JJ7YFgMGcjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773142027; c=relaxed/simple;
	bh=KUTBjDpvkVvQv79dF1VweLpz905Misc/auNCSrupa7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ii5SUWqUGujkkovrHnqto3ItCT0VOHt8LF+RJgVOS5MvohyN7g9DbZsPHwKHZNlA9mI9hwxK70ogEnNNyIh1nFM/jHHsNz3biIJhLMUVQXvL2m6ZjH1hPRFhP6cKJvKjDPEtKCinnVk1MzdhKTAVrYvAEyCiVcs2rIn+VtMWU5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eU4mZhbD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eU4mZhbD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55DDBC2BCB2
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 11:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773142027;
	bh=KUTBjDpvkVvQv79dF1VweLpz905Misc/auNCSrupa7o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eU4mZhbD267cywgJTGOLfjC128KwXy0ZnXwMGAG8ZMt5VR/oSX5uaNN1zmHldZ9fA
	 zHCdDClwAbppJocc0KnGe41Zh89hOJGEP2+uhwLDpYVHrmSJnYS1NvVssR7yBiePls
	 fxjUaaqoMvOKVKHQzQjULgj6ZWPE7r+dmUoLKc6tvlXkdL6MYCHG6F2kDPY6ltPkwS
	 ZEHWLAhGmr86hYpD+SUtf2AXWaIfDNMErhohFwNWYkY3UhLYQdj2tmkaXdn/1kQv5A
	 kSGC5B1NzxWj5HsbL/cAaSzYAOOQdpEbEaANWZZqh8rbHKoop/ofeUBrbKWbP0LWs+
	 Bhi2ytbb7xcWQ==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7927261a3acso114611177b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 04:27:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWLbkEGiWvgcdFgEEIa86mARyxOWM3YLXhd8vrK7MY1zqC9rXntyQqPJutxnNbN/9xaFu8mqs7RRpFg@vger.kernel.org
X-Gm-Message-State: AOJu0YzbFG14bm8YdEkmjefQS/ansRXa45vTbsekVM1443164ESwGfez
	3JbB2ecz/CKJVC4KaEAsMF19jZYC/pjg+6xyBy+0eOkx4sRq0NGlyToE2g3NIi2s4Y1HEaP5ynu
	oMKvEf0PVnNQ1MFz+AjDJsbYR7Kp+dp4=
X-Received: by 2002:a05:690c:7305:b0:799:8c6:9ccb with SMTP id
 00721157ae682-79908c69e34mr33790607b3.62.1773142026548; Tue, 10 Mar 2026
 04:27:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com> <20260306-milos-pinctrl-lpi-v1-1-086946dbb855@fairphone.com>
In-Reply-To: <20260306-milos-pinctrl-lpi-v1-1-086946dbb855@fairphone.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 12:26:55 +0100
X-Gmail-Original-Message-ID: <CAD++jL=6Xngpo8dmne0ckAFtWCQJLcN+-VNM=h80PpCLQFo=Aw@mail.gmail.com>
X-Gm-Features: AaiRm53K7tfBjuL50_2M2hYlFXVHTL5n0sOGcmXJEex3Hnm3H0CuXy5gTHWpZxU
Message-ID: <CAD++jL=6Xngpo8dmne0ckAFtWCQJLcN+-VNM=h80PpCLQFo=Aw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: pinctrl: qcom: Add Milos LPI pinctrl
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 6, 2026 at 3:22=E2=80=AFPM Luca Weiss <luca.weiss@fairphone.com=
> wrote:

> Add bindings for pin controller in Milos Low Power Audio SubSystem
> (LPASS).
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

I fixed up the subject as indicated by Krzysztof and applied the patch.

Yours,
Linus Walleij
