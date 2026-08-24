Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E90A2F6565
	for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 07:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787557577; cv=none; b=UYck6qeZ/wJ+16nWiZJP/BAnwnijEjEWsJfEajtsIi8OSLG5vYqTZGHPWrvMg6P6Wsn4ybzbmGKe9zzpMhrfrslFDI9PCgE1EPT6giBhmYCinB1WyaHET8hc4wmnTP0Bq7qS1c5Es6Tp7b/9u3Xj24H9Kr+vT6Mzea6ToOJ7lqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787557577; c=relaxed/simple;
	bh=oHDdeDzlMyKWjdnEU5UCzfkNdo9yiXY2stBua2Rdasw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7+oYn4EhRyhDbg6LVZYZpPxKqsA5Ok5DQeJsfd3/jaVo+sH/k9o6T8y2BXCXfgog8xkspkgobUgDZR27MIaFv3PrIUFiFX7GO8746swvIR47l4VeZo/hO56d9AbZ23PH3B9LAb4YLC5KkXbGsdJ+lDMdKioWASHV9k+Rn9ZiPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ebbm179a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MA9IHDrH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ebbm179a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MA9IHDrH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O67anU1662538
	for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 07:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u1UEfkp70xx0vLD/E4HUvwEd
	QnrJJo29zF4VvLZULIE=; b=ebbm179aTnExabRNo4ZQbYNeLgKwGWYOFwJVTYbe
	oqQKvsXbPIS8I8elsQS98Vxx9+ifEfmF2xl6pwR0vDpk1THK6e+KBrl2ngSuAuZE
	NlNcmveh9r3Un51vCDYyzd9prwusYrTg0ZrHqFp3IRpvv3nqvT/EOqmwRdr/jJ/3
	nITnt5Y0CrHAwJrnlowRDDzADz0VWXFHak9NEHJTYIxuxCXSLaaf/7bXXMiOLKV9
	sym8Elu4gUEqfg9qD/dJ3SRo/dhjM0+q8v6d9VtuK5t8HYXa2FdrnLcL4BUjZmvH
	Ak1AlFCYbns0RZO3jS/Lyo1Pw1ONdjoR5h4Rm/SrBPO0Lg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdsgead-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 07:46:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c19493ac2so38453021cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 00:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787557575; x=1788162375; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u1UEfkp70xx0vLD/E4HUvwEdQnrJJo29zF4VvLZULIE=;
        b=MA9IHDrH3CktstDiZ4nmyKTM7Sp+pAW2W3hrNzJBqoNWtOlI5jLsz469PPXFlgxJ4y
         FOtBa4yM5/a7Zx56r9whXdkNUoJqJ5NDgUNOP91sJPNrnJ0DM6SGY7+cJ9NFR+fP0Opx
         eXfs1DB2d83N6B+lyrEPcEht2kejgwwCo8zY4OLz5t/8AW+AscQp5LiIn66eQVut/Vkm
         wMKzuBn7VFli0ZXs07TYHOrZIto8s6Ss2Asxrwr7sq7XWvCbjoTKkjrKiNmQker+dCvq
         uCp53NBKuYV7tdvJCunlxhf7CG6aOOjn6uV9wgmeDTTZhXMbcgKHRtBLRKLJp+MQudA9
         J81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787557575; x=1788162375;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u1UEfkp70xx0vLD/E4HUvwEdQnrJJo29zF4VvLZULIE=;
        b=JV15W9bzfD/MVxMF9VrgINsmRnMHuvYdMFL1zCHXKxyF8GGO5YhEYV1SA2U21RzbGu
         zWJYATh3HN79S1V8dkVmpF4pWxeko2MhJg4Jp28V/dHmswi9z0YCb5Ndu5IneJzCDhBV
         sjKjNOogZl9EV4IupK6T+F1JXPNmweJ6SO8JgbjhXmY4aIr5eigM8CqaDY9BqXAOyhze
         XlbYOODbyEVvzH5lXYfmp0FXQXrM1wl7vFd6VZvLfdO2EM3JL5v01+a9wehyp2t3P98J
         jA8TegwFY+9/3ciUf0LjiEjD6/upaiBQsFDXTGjPuG3Lnt+b17vUHNfvgdQlq+zRIEHz
         XKhg==
X-Forwarded-Encrypted: i=1; AHgh+Rp5X8WOopBVEWvkhtAPNyXLU5IVeD1eLz1LRmIlcysTHKHcYyFOi3skUx7h6wxaMqkZbrq4OPxBNsBQ@vger.kernel.org
X-Gm-Message-State: AFuF++kJqwKR7ngPTV9bkwV4TFZ+HQgf6nApnhIuuImHHezehORQvyi0
	sCy1DzwKeYwbch+/Ql+7rt4D5b6nMxaWFkl6+YAAHo3cf8ubPeVk7daSMw6T7BRXGvV5T7eU9m6
	cFzJVD3tBNbpKi40HSPbx5c9XIF+k3JPzpkALsOqzN6ZSZA698fwUxdftBZUO6TxG
X-Gm-Gg: AR+sD120hPZlHSDp77n3Ya70Hr/t8DIy0C7mKL5dtfy11EmvLoNpY8TYcZR1Bu6dL4g
	L29zIWi9m+ufqgtA4rqha+eqFrKYedvGdFk0C/Ie3olL+VnPUXGrUPQ5y+OvsJ5mMhFKzz6cAvp
	LGtesPFTnFnjiiafp+FsiZi+Ji2S1eW1sVUmUg3WzGFP8ROPLc+PKAt6YZc8mejZtfCFa3JCoYX
	KAhuoP9T9dDvw1rRbuvBf/wZJ+FC++Ar63/DTQOhTE1JH6ZehJUysE3OgA5OAgfEwrpR6XZveIL
	YjWFv8xE5omkU7mKsp+z0u0RqeKXP1y7rvzFe3WKpVcnfxPutWek5YQAsqM7WJQ7KkkyBTffZpz
	a4K/CzCoOPycwbXE=
X-Received: by 2002:a05:622a:a07:b0:52d:94c5:2212 with SMTP id d75a77b69052e-52df56f696amr234846531cf.3.1787557574364;
        Mon, 24 Aug 2026 00:46:14 -0700 (PDT)
X-Received: by 2002:a05:622a:a07:b0:52d:94c5:2212 with SMTP id d75a77b69052e-52df56f696amr234846011cf.3.1787557573742;
        Mon, 24 Aug 2026 00:46:13 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f9cbcsm1254309066b.29.2026.08.24.00.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:46:12 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:46:09 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh
 clocks
Message-ID: <5gwqlrycd36aqu2xhzcil6rs55v5qbe7yshhbedwacq3xvaufh@5xi4z6xyhxls>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-5-196e2b306368@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-kuno-soc-support-v3-5-196e2b306368@oss.qualcomm.com>
X-Proofpoint-GUID: jS5jvVA-nqrNuQa9pAu49yiN0etG_O5G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2NyBTYWx0ZWRfX2fxTshjCDwNH
 oN5S6lDsOorlOLK1eyeg07qzUNxv/jpMtRWZFz1UcWGcZseZDWq3i8n4cl7AIRpUkbjMXdso96D
 NhOciPL3Bp3YMjMX0UIdZaAi5cOC4+bxgBu2xRSAP4Mtb/o5de2F9Vujq9/OTTK+rsnX8gmtA9T
 qIND8nFU/5tF0aSbpirpzA0WVFHPdvL0YFb1YbeQP9C6/2MAroNEVK8yR2ljb8iUhuelyJ/j3C9
 mPq1ehKNWzzr3qae6+afPPIn5QDbaWAuLMXYRfW0UlfK7fjPOntsjvZ9NQOEJYMPm8CH1hI8Ck3
 mjXx6MiBCF0p8lz8ItSX7b54hRUc+AGBC2h9kxAnARq/3NO+U823Vh3YKoIouxIILB3SuCTMc2/
 OcpH0hZYeR8VbCSGmlVKMBc4bBckfGX+idFzNMya0+H4rnhJZoLAby6y9oGq9SQzsF93cE7UC2J
 USZtV3MwY4+YA4T4yTA==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8bf6c7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-YGGs88sVoTMC7_f4VAA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: jS5jvVA-nqrNuQa9pAu49yiN0etG_O5G
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2NyBTYWx0ZWRfXyoSczFT8raAD
 WDybWqbYxzIHIE7HrBZW+04TfQUN+/LlleBTjHWTA/qDlXWklGyvAnzCXJzmPjJACHaT/ZTT0Ii
 xqEaPp9gXWLpST9MVgWnTqR6R1nOJG0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240067

On 26-08-21 21:38:58, Hardeep Sharma wrote:
> Add the RPMh clock description for the Qualcomm Kuno SoC so the
> qcom,kuno-rpmh-clk compatible can provide the RPMh-managed clocks to
> consumers: the CXO div-2 (and always-on variant), RF clock 1 (and
> always-on variant), the QPIC BCM clock and the IPA clock.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
