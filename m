Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881C53C4561;
	Wed,  1 Apr 2026 08:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775033522; cv=none; b=FoiCOxdMciO7oQ3XmFrlVTMr2WgJ4wC+XxueqMzjtNt86EoGoISkRQZb314ib9LzvKAobaHJNW7C7GMmbGCCGc4Iq5Ivm+4bpW5Fmh5qS5yfUKEtnRs/ia7FeJGUrNvPyif7k7ebHvp0SHD3VYZEgu7IUuIDCfGXEKpdVHfRQmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775033522; c=relaxed/simple;
	bh=nv1HM9EK81Wxt5UcXTHE22Drnq7E1kaELXG2AZ5lQbE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=mIMOMxpj4P5j3X5TlhHj2cLPCADZyseB0p1x1p/CBm93DW+XIPwzTdit4evG553xcgtEM59QLjqQQJE4nPYsduw1Wqi6RGOFZbhWBJMb1vcCIkuYeTvrdJSRZEWu7HW6ssARbg6HHsitiyhaH2IMhI1rVNXISvsyTI1pxTc13lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=It6SReFZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="It6SReFZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDFF3C4CEF7;
	Wed,  1 Apr 2026 08:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775033522;
	bh=nv1HM9EK81Wxt5UcXTHE22Drnq7E1kaELXG2AZ5lQbE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=It6SReFZtinDnIoikAa5Z0HsKLUu+Jd/gQEQohDEz3sao/KLW3qB8kT1ztOZ4JaPA
	 J+ctKwulpSfLTA9UM3nBWigEE0oeu9Cs2dglKn72gdf0K/HC7sypasIwPU+ekkf7o6
	 VzoXDWsZdH0P9wxLajedB6UwRLGhZYNFJ8dP2AmN7+FzaKdv2kOm982Hd3RGxHdY2G
	 oy/Mf7VMwYCmm7dLckxhn205qmM3G5r+YA4qth4avi/byGzV3jWRWZtYcDDbCFcjol
	 +DtQgBHXuduAeRZuka07slhh2qseORpzVOzWPFFeSfvxH7q+jdECRnZpPdgKWwzilv
	 mKaGw61ac/uBA==
Date: Wed, 01 Apr 2026 03:52:00 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 Ondrej Jirman <megi@xff.cz>, Conor Dooley <conor+dt@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Jagan Teki <jagan@edgeble.ai>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260401-waveshare-dsi-touch-v1-5-5e9119b5a014@oss.qualcomm.com>
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
 <20260401-waveshare-dsi-touch-v1-5-5e9119b5a014@oss.qualcomm.com>
Message-Id: <177503351924.3337315.3582492535599427935.robh@kernel.org>
Subject: Re: [PATCH 05/19] dt-bindings: dipslay/panel: describe panels
 using Focaltech OTA7290B


On Wed, 01 Apr 2026 10:26:24 +0300, Dmitry Baryshkov wrote:
> Add schema for the panels using Focaltech OTA7290B controller. For now
> there is only one such panel, from the Waveshare 8.8 DSI TOUCH-A kit.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/display/panel/focaltech,ota7290b.yaml | 70 ++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/focaltech,ota7290b.yaml: ignoring, error in schema: properties: compatible
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/focaltech,ota7290b.yaml: properties:compatible: [{'const': 'waveshare,8.88-dsi-touch-a'}] is not of type 'object', 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/focaltech,ota7290b.yaml: properties:compatible: [{'const': 'waveshare,8.88-dsi-touch-a'}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/focaltech,ota7290b.yaml: properties:compatible: [{'const': 'waveshare,8.88-dsi-touch-a'}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/focaltech,ota7290b.yaml: properties:compatible: [{'const': 'waveshare,8.88-dsi-touch-a'}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/focaltech,ota7290b.yaml: properties:compatible: [{'const': 'waveshare,8.88-dsi-touch-a'}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/focaltech,ota7290b.yaml: properties:compatible: [{'const': 'waveshare,8.88-dsi-touch-a'}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/focaltech,ota7290b.yaml: properties:compatible: [{'const': 'waveshare,8.88-dsi-touch-a'}] is not of type 'object', 'boolean'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/focaltech,ota7290b.yaml: properties:compatible: [{'const': 'waveshare,8.88-dsi-touch-a'}] is not of type 'object', 'boolean'
Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 8, in <module>
    sys.exit(main())
             ~~~~^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/doc_validate.py", line 66, in main
    ret |= check_doc(f)
           ~~~~~~~~~^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/doc_validate.py", line 37, in check_doc
    dtsch.check_schema_refs()
    ~~~~~~~~~~~~~~~~~~~~~~~^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 241, in check_schema_refs
    self._check_schema_refs(resolver, self)
    ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 212, in _check_schema_refs
    self._check_schema_refs(resolver, v, parent=k, is_common=is_common,
    ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                            has_constraint=has_constraint)
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 216, in _check_schema_refs
    self._check_schema_refs(resolver, schema[i], parent=parent, is_common=is_common,
    ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                            has_constraint=has_constraint)
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 203, in _check_schema_refs
    ref_sch = resolver.lookup(schema['$ref']).contents
              ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 682, in lookup
    retrieved = self._registry.get_or_retrieve(uri)
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 422, in get_or_retrieve
    registry = self.crawl()
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 500, in crawl
    id = resource.id()
  File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 231, in id
    id = self._specification.id_of(self.contents)
  File "/usr/local/lib/python3.13/dist-packages/referencing/jsonschema.py", line 50, in _dollar_id
    return contents.get("$id")
           ^^^^^^^^^^^^
AttributeError: 'list' object has no attribute 'get'
Documentation/devicetree/bindings/display/panel/focaltech,ota7290b.example.dtb: /example-0/dsi/panel@0: failed to match any schema with compatible: ['waveshare,8.8-dsi-touch-a']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260401-waveshare-dsi-touch-v1-5-5e9119b5a014@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

