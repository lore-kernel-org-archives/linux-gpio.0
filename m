Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466B241C303;
	Tue,  7 Jul 2026 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431112; cv=none; b=mWJ3Y7febxNvgzSSRYEXHiBk3gqJConwCAgbDR+ZXuyHzpPA5f3i++EteXylzYvuIC7kxwcKlRMwPXFkxj9BhAnWzwYyocx4E6xBcpox2+/XnWcdi7BA80gT7ZF7QbGIn49l4jLTvhgFdb1Xp244no5li+YmYNZ35+JN37FycRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431112; c=relaxed/simple;
	bh=hi/Y+A3iq1QCnEQaABM1Al+dWo3tQdQQkvsTHsJHAPA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=oOjl/TFlga9oKp9dpijiF7bH7diVEvxZC5TWdScLKWDRHuR9ITdV8MFdl0Z+KeVFrGrhHvdUl+W4XRBytdhaZJeY4tGOjqT8UqyP1Jn9lCvQmsjaJKjnJP6egk62/10mh9MXEgYc/tFC0LA8TfNWE8PyleWdBuer7IDzzYtXNnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DrkBnN6j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DrkBnN6j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD9E41F000E9;
	Tue,  7 Jul 2026 13:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783431110;
	bh=ECOtrfboglA7MkJelsbi7HV7rJGyEpwDPz5UHei8RS8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=DrkBnN6jqvpb8+cx21YZaMG8fQmC584kQsNB2GTUBNe6ad8k6jjfxmX67n3DBmhuy
	 AdlO0ojwGgFnJgRZhegI7+/V+K2BPKuz0jd5ih8BDy6UTTzWr4ez3VdKvK0ujffn5T
	 IqBIQtiDPpd4XIWtrM8AsG92dkXtG6zzMHe6PjxdCDA93fJeJrBjY6I5dPswrpaB0a
	 V35WD4/2vuucynF7HGlRyMe2OD60yLnGRSq3pFi/LHhlnwxDN6rhSzx57wG8hzSlMs
	 75/orX+wl3LNSKDTks1QSHUAJ6dg+VoZXRllohql0W1+FnMtX8wM2y/JzelOiwLIMT
	 sGB7y5SOGUzSw==
Date: Tue, 07 Jul 2026 08:31:50 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 mohammad.rafi.shaik@oss.qualcomm.com, linux-kernel@vger.kernel.org, 
 ajay.nandam@oss.qualcomm.com, Luca Weiss <luca.weiss@fairphone.com>
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
In-Reply-To: <20260703073029.2588960-2-ravi.hothi@oss.qualcomm.com>
References: <20260703073029.2588960-1-ravi.hothi@oss.qualcomm.com>
 <20260703073029.2588960-2-ravi.hothi@oss.qualcomm.com>
Message-Id: <178343111013.2437204.2936966826993460040.robh@kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: pinctrl:
 qcom,milos-lpass-lpi-pinctrl: Add Eliza pinctrl


On Fri, 03 Jul 2026 13:00:28 +0530, Ravi Hothi wrote:
> Document compatible for Qualcomm Eliza SoC LPASS LPI pin controller.
> Eliza has the same pin mux functions as Milos but uses a different
> slew rate register layout where the slew rate field is in the same
> GPIO config register rather than a separate dedicated register. As a
> result, Eliza only has a single reg entry instead of two.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> ---
>  .../pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml | 22 +++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml: properties:compatible:oneOf: [{'const': 'qcom,milos-lpass-lpi-pinctrl'}, {'const': 'qcom,eliza-lpass-lpi-pinctrl'}] should not be valid under {'items': {'propertyNames': {'const': 'const'}, 'required': ['const']}}
	hint: Use 'enum' rather than 'oneOf' + 'const' entries
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260703073029.2588960-2-ravi.hothi@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

