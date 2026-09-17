Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF574B44AA;
	Thu, 17 Sep 2026 15:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659316; cv=none; b=VoP//a98Dsih2h+akgnw98h7ywh7/kbYDCmMIcHnZxDTGdI8OoSgwwJxOChGuRHrNS6Jt1AKlJWVVH5rF9wPdTJE/BiKtjTl0/5JPzLbMacLOagX5O3wwfL18kXteqmYfgcgvz2FKAZzBoakfTyte/i7Uk3V9f/yTuJlWmSYetw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659316; c=relaxed/simple;
	bh=Dh6tUyQP9xyXhZWsWYa7WA4mu0Sws+dL1p7Kflb1hFk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Em68y6F+iLDxZAOSNj9E+Wl6qAGAj2CKRmKrRR6YIoObVDmfINcVDvqOT0Fn6ifbc3aojc5gLoREkAG1Kwz9EplmcnGevmH9IAKy13Ze89EUz9FHdWD7Sg2y5S3mNyMkSC6bWt0MDRzKY/QqjHbLsZKjPak5bvz9urilJJniTbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nvHb8BnH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nvHb8BnH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7571F000FF;
	Thu, 17 Sep 2026 15:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789659302;
	bh=byzDL3MM3tw9yBCOxQadk27VtOlUpG08zfgZFmn7Qx4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=nvHb8BnHVmnWvOPaWQkbtOqXe6xbAv1B7uJUuoCalSS+Qba3wk76RY0ZerNxby6an
	 bLvpuY9NlPw8aUMhvSt5nMI8G5EmKxxCsXmPplY0DFI44mCa/a1gRta6L+AVUNfdLo
	 oXLvPZ//YDLxV71wXesQxGrK10oSq7Dxv6laFaE6R+Iju4lkbH0Pqm/l7AfK6Xd8Tx
	 8AAby4VCZ7A5mzJ7cVtZEEYz2eWQEYRdfWWsbDjCBCQoX8cJ52iuGFJst6VXhS+5H1
	 r2J1u/qaANTp4Nbiif2sA/uOsSctgGh7sSAULQJUIqh0nMKaigRHZMYuqAMZxBecHi
	 fF3nEK+Ti+6/A==
Date: Thu, 17 Sep 2026 10:35:00 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
 devicetree@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linusw@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Takashi Sakamoto <o-takashi@sakamocchi.jp>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Rodolfo Giometti <giometti@enneenne.com>
To: Eliav Farber <farbere@amazon.com>
In-Reply-To: <20260917075611.47881-3-farbere@amazon.com>
References: <20260916182641.9768-1-farbere@amazon.com>
 <20260917075611.47881-1-farbere@amazon.com>
 <20260917075611.47881-3-farbere@amazon.com>
Message-Id: <178965920965.2201509.11424324343969407479.robh@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: pps: pps-gpio: document optional
 pinctrl states


On Thu, 17 Sep 2026 07:56:10 +0000, Eliav Farber wrote:
> When the PPS input GPIO is routed through a pin controller, a board may
> need to mux those pins to a different function while pps-gpio is not
> driving PPS (for example after the driver is unbound or across a kexec).
> 
> Document the optional "default" and "inactive" pinctrl-names and show
> both in the example. The "default" state selects the PPS/GPIO function
> and is applied by the driver core before probe; the optional "inactive"
> state, when present, describes the mux to restore when the driver is
> unbound or the system is shut down. The driver looks the states up by
> name, so "inactive" may appear in any position; it only requires that a
> "default" state also exists.
> 
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
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
>  .../devicetree/bindings/pps/pps-gpio.yaml        | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pps/pps-gpio.example.dtb: pps (pps-gpio): pinctrl-names: ['default', 'inactive'] is too long
	from schema $id: http://devicetree.org/schemas/pps/pps-gpio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260917075611.47881-3-farbere@amazon.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

