Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4081839060A
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 10:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430967; cv=none; b=MbsZtq/PuiBmaUdQSlwd5tVm9lCUsIazVDoeCXf7rgQY9N7LFbvJ+QYiJgcZS1zmNKec78soCLt07MRj71fWSxiKkKcw7W5/SWSE+AlQAfwuVLGLw16lM7RX07LE4E4ikE2747avcjP7IhyjQmG2r6pR6qik7IyJbLXyeX30W18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430967; c=relaxed/simple;
	bh=IMVVshXwxDDSJzE0l8MvT/fRHMRPsXvntd5GyUh3aFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OhxtBNdk+77n70+5CWlTfLr5gar1YqCpNlPgCKbIzwhUUwyrE4EJuVTPtnaKhIa82+lbPw7eRtfoRw9qChGFMkhzijJyQxHvFzdkCQCnMCgNJofUOyPlVHUaxVWkah0UiPFp0ZhOa5HIaWi66p7axYeMPonirOa3Uoz2dMfzTBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/t0/AIQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iHCvlG6V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E/t0/AIQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iHCvlG6V"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHM6l3852417
	for <linux-gpio@vger.kernel.org>; Thu, 3 Sep 2026 10:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MWzDrNxzthWPdsVZldsnWvMx
	9IcczP+HYo1LJtEAQps=; b=E/t0/AIQJNXxavIvF4DSXyZj0XFMxzjyKFoBboju
	8R6N1Darux0BmyjgQfyvsnYAbW88jDZ7/pMCxRBwQq73SRc0dKaeRXwoRvx4oU69
	xYnX4LRp+pFaJqQJ/hXZWq7B7/KqK4Haa6o6ClZv4ZzJbrgzFYLuzG86M4ivfKzz
	XR466xDjYKLFSGmrfvDG21XyL4wP9hQxCmouI8W7tvI6qYo6XovD8cD9inVfgmqg
	Nio5fA/LHms+iuYTVX9x1HgmlOcKicjFFZhW8nA70nFniMJ5/CFchnI3w7vE1sUW
	3To+/4/ZTDrHbDajvLFfE0A2Tc1w10AR+/bJy76HS7MFVA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf51m0k2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 10:22:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so570246985a.2
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 03:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788430963; x=1789035763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MWzDrNxzthWPdsVZldsnWvMx9IcczP+HYo1LJtEAQps=;
        b=iHCvlG6Vp1u7EWzgmoAR3o1n+AIUN1QOoekf8aA8lDEEJDGUyrepvCUUcG4zorY1iG
         XoPnpmWX1XiHAfNFXNb7wnaX9rf5EQZtU12HBkgbTdOl3zdnJHo1jxlnutaso17Fv0nq
         bf/fIhdN83dYv8FEcynUG/QnsbXGW2L/KiSOzA368HqaMUVn3jlM+aua5Krug7ZwDsOR
         tsuheBiNLh5XtFGCwjdLIflsNkjD7/ZguDQg/HeSu1+hwJpx2vY1A+lSSGF9rLmVzanD
         1DbmR+IOnBuDFbB+dRQeiM376v39lDDo7nMjZYRr/hyjytOxo0dF7CSfGgl2SjmhPftk
         joXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788430963; x=1789035763;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MWzDrNxzthWPdsVZldsnWvMx9IcczP+HYo1LJtEAQps=;
        b=eDyNitxTxRv2pz1ABawmF4ALdKo3tnU55gcUbJu4kX8932uJ56sVG65DouSYO04Lpd
         7DeaJhslBEOK5cFbPk9CACat4zZTAHHhvuybEj9wH5HxmiZhjz+NH1f6cABrgxYS0t0F
         XAPX76eH7xzJKaMxQxr3rg+UKYo+lp4zcVr0AXiR7G9dbHt+D7N1boWcq7ych1OFy1oL
         6RnIkf7plQ4gNyX7vrM3hZYE7CiyWNTYun/Ao8v99/zBT81e6STMcffa2bp0nLxV9Rsg
         qJVjHWpNwr6MA6QwNtkev9DIzla6bj84alL9twDyeX1iz9Zt+xkjCIUcLkR4PRVZJG9h
         2EEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLWNWnx3xMhBJFJk0iuWi7VO6VhgGJAY10s7W/d1Nj4aWpyl5Q3agl6iEKY2CAgEstYlXjbjUgp26Z@vger.kernel.org
X-Gm-Message-State: AFuF++nmKu1JRxv++GMkAX1ABiwn2yH8jqwAxKVci+DuvAceyQwYP34k
	FhZgRS0Bzll5rLs2Gu4LH2WWcD/Z/KME8+Ly4EQLloYVahnHJIFyU0TA0fFiu/hwYe0dORZx32p
	+mrUvJovuDVPUcXTSZ1Njw58GJawJRJR6ZR+z5hI73hwUZ7xKOnpGby9Pt9u/Vofg
X-Gm-Gg: AYBFou0XwpvJLN5OEYsLTud0x3Hek6Der58UkysRFCOCV7NNf6615OKjT2p+X09T9m4
	5hKqKXhlMSKSqzRVjhJkpT6Erb3VFiqQPZpJvR+rLLlHQ33rBShesRX67BdMWWj8m52vtOghmAI
	NEN64KAzEc0E/lFl3T5X4pixzq/LXQ1USY85HnAaonsMsJA3Iftuh/5UaEWzTn7PSitYXgid2G3
	RVEi7Tni4fxFLO9l5zDU3xO0FPB/cwp+WBvYSg+eWUQEpedZQ/ulPO3WRAa6924JmWeVBdL3dOT
	Bt4Al9LaeSifSdn5A2zYoDzLh0NtFOAyChyRdIaz2aDxIF1ohcbDVlUy8fwoMZBqXRgpMdzvl2B
	IqhTEgT08aU6hsw==
X-Received: by 2002:a05:620a:6010:b0:939:6132:62cc with SMTP id af79cd13be357-93961326388mr1435827685a.27.1788430963433;
        Thu, 03 Sep 2026 03:22:43 -0700 (PDT)
X-Received: by 2002:a05:620a:6010:b0:939:6132:62cc with SMTP id af79cd13be357-93961326388mr1435820785a.27.1788430962820;
        Thu, 03 Sep 2026 03:22:42 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5e589bsm55667075e9.13.2026.09.03.03.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 03:22:40 -0700 (PDT)
Date: Thu, 3 Sep 2026 13:22:37 +0300
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
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 07/15] interconnect: qcom: Add Kuno interconnect
 provider driver
Message-ID: <xkyj7x2chonmrovnwaosd7sci2txi7bsbpvv522uzxdonkke7y@5kpqjal3i6nm>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-7-6d47636a8f09@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827-kuno-soc-support-v5-7-6d47636a8f09@oss.qualcomm.com>
X-Proofpoint-GUID: fbTXh-CuiPdC-hgWnOEJ5pnIs5Q5yNlV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4OSBTYWx0ZWRfXwpDcKWk23ARV
 CU6/FqHrEG/ChZ3jmI5EAUFpCwEiC00C8zUjQBV606i69ZsS1pq4S8oR95NhbwnbsWqt6Z64V8L
 mZg3SCaLltbWcTSDnAtvM6A8UOLEwSKILJ5hExC7AvurB6sAxz001jANL/nhT/ZfFPUpiX4N9+x
 c7zL1EtFqAjw759XohJkUkWHLpLcM3B0oZ+GIh6SgpJcK+2tvorgP796Yha7eXvsOnjhaan0pdT
 y8mxd5vQnPM1WYcTGpuCTpeQuocBYCihw7PEEsBtXHWlHZf0MAy51XcX6rGIgbiXFr4Tn/1FKEQ
 JXailaPEKR1D2S3DdOR3qV/vqktEVKnUed3IPkrEBnxo+LzvCKafSjgD2msHcYlNK4dbrdcEBPG
 18jxYBRh+mTcZDPJRZzttACXWDEfAGmFl1Iqmnz+lSDkQZW/HXvp5oOisGRHwPLr5kek9xdcoCr
 dKXSno0Vo7dZm1Ejmmg==
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=6a994a74 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pe0felBmJweB1gBNqhwA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4OSBTYWx0ZWRfXxMQGY6KUBwfJ
 UF7OtLlf6zOG2mJDSmEUkbIztUBEFWhLoSH29IGthJt/fxyGnzdIsbR/eMXjS9T2TdTx2DxKTxX
 +sjwQ6jSHnAfsR3iWhRcXA0gAtA+Ls0=
X-Proofpoint-ORIG-GUID: fbTXh-CuiPdC-hgWnOEJ5pnIs5Q5yNlV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030089

On 26-08-27 23:21:10, Hardeep Sharma wrote:
> Add the interconnect provider driver for the Qualcomm Kuno SoC to
> enable bus bandwidth voting on the platform. This includes the
> aggre-noc and cnoc-main NoC instances with their associated BCM
> nodes.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

Looks OK now, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
