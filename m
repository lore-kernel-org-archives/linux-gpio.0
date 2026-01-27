Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857AD2C0282
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 18:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769538488; cv=none; b=aSH0cs2Ni/Fl/XhtzXaV1eOukSAO8ayQ4Imr5SWYFkGfNIWIRZQ24MK+9IMZDJ/WfrSYr9yu5ZDN5agco8kUobuOE2ah6W/tvMprz9L8NN3VYDbBCTOB+8kSDWBc0B0W4Ld1UaF9jvkwJcTEREhbsbamfwKhgfUI4vx6KBAslGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769538488; c=relaxed/simple;
	bh=W7/a56tUf3Lkr+2nWP3N9biS9HWxHhESOTwUsHEZtxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZGWGy+HmvlqWC5a70AXTglexMwKbrVM6ewm6+a1FeDl+Axz3MysnZgfCrvATB2VgwHIGrlZ+s7hCqCvcauSPD6dvRxeIMjAU8OMdT5wgTiAtQZ7A/0Dk+SrS5WnD+u7kGX5G/AYli867x1av1dWpZHmVcvfRqpalxgBNc16BAEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cd+58DKb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cd+58DKb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56367C116C6
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 18:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769538488;
	bh=W7/a56tUf3Lkr+2nWP3N9biS9HWxHhESOTwUsHEZtxE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cd+58DKbaWPU7AeqWOYvcEicYkScsgKVT5c8z+rQgA1RYHT/EZa0Q4sryRYQb2iMz
	 7olyND3mML/1PJARHEeGCKe6N4eyVFWFtwXLL/VWI0N+TIQ1WBKxr0vf8+wJUfKhMT
	 1BD5EUj0PA5Mdnva6TjguXn7AHH5HqRdQ975/jc5vxIvL9qoNo6grpgxjhtXPSnDEe
	 HNNyBYgmA8G5NVVpvNlM9RMwjvhrCSy4N/GUkuPkkVmU4p5loekCFymhYWnvU+lpIW
	 PD2kfYk23CdVVgBaW0QFIRhpABi6RNj/MvrfmBZpPz1qChDVi+zwpMe00ybc1QcLnS
	 quNzIHIbQ6NAQ==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6580dbdb41eso8467900a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 10:28:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVJJ4jDJE9IAiWaTpfNC51/bJ8tqK6KMmyuYcXTJ+uQMvSmrCtYay6XQDtCOP9lyXQEPR39fJrFD+9B@vger.kernel.org
X-Gm-Message-State: AOJu0YzP+2BEvc+x4+pUaRIresKG7LJ1qOiGv1PTbsd7GAfBTMFB4BPZ
	mAIOfV+6yZwRL5hhB4L9VmnjK6+WOpdWDlOkL8xLeaMwvrpVEm7PPN+3fOq7QvxxHNWQitilr5H
	W+KSPjEwSfgBYd7qDQrA6GuGt1swYAA==
X-Received: by 2002:a17:907:3e14:b0:b88:5002:50c0 with SMTP id
 a640c23a62f3a-b8dab305bf9mr203203466b.20.1769538486920; Tue, 27 Jan 2026
 10:28:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127105511.3917491-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260127141740.GA1574044-robh@kernel.org> <9f5436df-fef7-4921-85b3-b6fe4e942779@oss.qualcomm.com>
In-Reply-To: <9f5436df-fef7-4921-85b3-b6fe4e942779@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 27 Jan 2026 12:27:55 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+YYxWKaD-Xo7L3VUAJ=wvpbfW9GkKn0gcj3AOvMb=Uhg@mail.gmail.com>
X-Gm-Features: AZwV_QjHB-GlP9dv8BmFRD-SF_vPG5R2x4sdb1do0pgOa5KST72t95IKMHbIpTk
Message-ID: <CAL_Jsq+YYxWKaD-Xo7L3VUAJ=wvpbfW9GkKn0gcj3AOvMb=Uhg@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi-pinctrl:
 Add SA8775P and QCS8300 pinctrl
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 12:13=E2=80=AFPM Mohammad Rafi Shaik
<mohammad.rafi.shaik@oss.qualcomm.com> wrote:
>
>
>
> On 1/27/2026 7:47 PM, Rob Herring wrote:
> > On Tue, Jan 27, 2026 at 04:25:11PM +0530, Mohammad Rafi Shaik wrote:
> >> Document compatible for Qualcomm SA8775P and QCS8300 SoC LPASS TLMM
> >> pin controller, fully compatible with previous SM8450 generation
> >> (same amount of pins and functions).
> >>
> >> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.c=
om>
> >> ---
> >> changes in [v3]:
> >>   - Removed the duplicate driver code patch as suggested by Krzysztof.
> >>   - Reused the existing SM8490 pinctrl, which is fully compatible with=
 SA8775P and QCS8300.
> >>   - Link to V2: https://lore.kernel.org/all/20260107192007.500995-1-mo=
hammad.rafi.shaik@oss.qualcomm.com/
> >>
> >> changes in [v2]:
> >>   - Fixed dt-binding errors reported by Krzysztof and Rob.
> >>   - Added proper slew rate value for wsa2_swr_data GPIO, as suggested =
by Konrad.
> >>   - Documented Monaco compatible as suggested by Konrad.
> >>   - Link to V1: https://lore.kernel.org/all/20251116171656.3105461-1-m=
ohammad.rafi.shaik@oss.qualcomm.com/
> >> ---
> >>   .../pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml         | 10 ++++++++=
+-
> >>   1 file changed, 9 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpa=
ss-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450=
-lpass-lpi-pinctrl.yaml
> >> index e7565592d..354629c38 100644
> >> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-=
pinctrl.yaml
> >> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-=
pinctrl.yaml
> >> @@ -15,7 +15,15 @@ description:
> >>
> >>   properties:
> >>     compatible:
> >> -    const: qcom,sm8450-lpass-lpi-pinctrl
> >> +    oneOf:
> >> +      - const: qcom,sm8450-lpass-lpi-pinctrl
> >> +      - items:
> >> +          - enum:
> >> +              - qcom,qcs8300-lpass-lpi-pinctrl
> >> +              - qcom,sa8775p-lpass-lpi-pinctrl
> >> +          - const: qcom,sm8450-lpass-lpi-pinctrl
> >> +        minItems: 1
> >> +        maxItems: 2
> >
> > No. You are either backwards compatible with sm8450 or you aren't. The
> > h/w is fixed.
> >
>
> ACK,
>
> Agree,
>
> Need backward compatibility with sm8450 for both sa8775p and qcs8300 as
> they must fall back to the sm8450, so initially used enum to pick
> between the sa8775p and qcs8300 compatibles. I see enum isn=E2=80=99t
> appropriate here since fixed h/w.
>
> will use the const instead of enum like below.
>
>   properties:
>     compatible:
> -    const: qcom,sm8450-lpass-lpi-pinctrl
> +    oneOf:
> +      - const: qcom,sm8450-lpass-lpi-pinctrl
> +      - items:
> +          - const: qcom,sa8775p-lpass-lpi-pinctrl
> +          - const: qcom,sm8450-lpass-lpi-pinctrl
> +
> +      - items:
> +          - const: qcom,qcs8300-lpass-lpi-pinctrl
> +          - const: qcom,sm8450-lpass-lpi-pinctrl

Sigh, no. The 2 entries can be combined like you had. Just drop
minItems and maxItems from what you had.

And test your binding before sending it.

Rob
