Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2310042586E;
	Wed, 23 Sep 2026 18:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188916; cv=none; b=S7Lad7C8Sa/+5BIfL0jG+Zx0GiBnw4semhQCC1RfRZTMxE/XedABb3hUFacogaJV+gyM8zMhoGjYYqx6FRn3NNuNMSfoPm8Zysjp8DkbdQsgtots/0py81wTTvU0b7e7kTwUy0I4QtzoMCzazMz/NbeUHZpTKfYJW24sOCTVXPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188916; c=relaxed/simple;
	bh=wH9fzjJjsVJJiazkPUrC9dGMua0cFBByR9nN52HAB/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RkxShijjQxRy/4u0d8HqSaWwVVqbvn9CPomJNX906L8S3klwYOt7hA5SI4Yorbm4v6qPlYf3+MYhmCg5DDnny4aqKYiUU+3KnMYBh/oNoKu3LVF3wSoMk0cvKkhHFl8x999oZQYF1ewm1HejNFmEG3xa8psjblrFV09MnRlxk1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IIWKXPZf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IIWKXPZf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B251F000FF;
	Wed, 23 Sep 2026 18:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790188914;
	bh=nZDXKbITpkcrKWVXOtjBg8RScce4/HXC6iV6SD+Qpjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IIWKXPZfrpQ/JNdqTX5pQJafUbZWRo1HUujmYERtrtWGbcwrgWdbuQODm8/kNzcpd
	 aXUPINmFbvmEevIrKto6XLcE+9uKPn9HCFLAh4/D3VrmhQe01ptdkOPPBuYBn0rFu7
	 Zkc8FTgqrT8xohyYcES+XvlV0FGYvMIqwpWqyb4sE6hheiYUo8Nu78TNnzqBdNKdjN
	 Ek60ppSsKSmmVJxQMVtEdeWSiBRbRLFqp6HyslkWtuSrL7oj4tRI4WCJRwKjhlTk28
	 qMMbjRiMlorL2liTIbnzg3K1ezL56YDeUfmlHczfIGrnVUnP+tjV+On0AgB1UzGtoq
	 u/7cnt/iZGFSw==
Date: Wed, 23 Sep 2026 13:41:52 -0500
From: Rob Herring <robh@kernel.org>
To: Eliav Farber <farbere@amazon.com>
Cc: Rodolfo Giometti <giometti@enneenne.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/4] dt-bindings: pps: pps-gpio: document optional
 pinctrl states
Message-ID: <20260923184152.GN27237-robh@kernel.org>
References: <20260922103051.5257-1-farbere@amazon.com>
 <20260923182243.41060-1-farbere@amazon.com>
 <20260923182243.41060-4-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923182243.41060-4-farbere@amazon.com>

On Wed, Sep 23, 2026 at 06:22:42PM +0000, Eliav Farber wrote:
> When the PPS input GPIO is routed through a pin controller, a board may
> need to mux those pins to a different function while pps-gpio is not
> driving PPS (for example after the driver is unbound or across a kexec).
> 
> Document the optional "default" and "inactive" pinctrl-names and show
> both in the example. The "default" state selects the PPS/GPIO function
> and is applied by the driver core before probe; the optional "inactive"
> state, when present, describes the mux to restore when the driver is
> unbound or the system is shut down. "default" is pinctrl-0, matching the
> implicit ordering the pinctrl core already assigns it, and "inactive" is
> pinctrl-1; the driver looks each state up by name.
> 
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> Changes in v6:
> - No change. Rob Herring confirmed the two-entry ["default", "inactive"]
>   items list is fine as-is; the "sleep" state discussed on the list is not
>   something this binding needs
> 
> Changes in v4:
> - Rework per Rob Herring: do not express the ordering in prose; use an
>   ordered "items" list ("default" then "inactive") with minItems: 1,
>   since pinctrl-0 is already implicitly "default" and its position is
>   fixed. This also fixes the "['default', 'inactive'] is too long"
>   dt_binding_check error seen on v3. Reword the commit message accordingly
> 
> Changes in v3:
> - Do not constrain pinctrl-names to a fixed ["default", "inactive"]
>   tuple. The driver looks the states up by name, so "inactive" may
>   appear in any position and other states may coexist; only require
>   (via "contains") that a "default" state exists, and reword the
>   description accordingly
> 
> Changes in v2:
> - Rename the released state from "idle" to "inactive"
> 
>  .../devicetree/bindings/pps/pps-gpio.yaml          | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

In the future, don't thread new versions to old versions.
