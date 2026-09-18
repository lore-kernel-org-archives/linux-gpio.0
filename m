Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7506B4A0EE7
	for <linux-gpio@vger.kernel.org>; Fri, 18 Sep 2026 08:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789718465; cv=none; b=PRbs9xufDdGkpZ5oIMmFRnK1TUd+xHvkDXm2XWx4XXIbwg0imSZNDPYyyDaEvGPpiwcVWEhEmUxP02dvPu+O9geB9LnN5idtlF/8IgtGeI7AH+KIZz1nPFJSYio2Fm+FL/ulKU0spltJXpdtdHPE2u19STV0mKzTQMH0Hb2T/iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789718465; c=relaxed/simple;
	bh=8+ZoiSE0QUXpLLvwBa7Gs5wfMdhLA1mfwYrQghFEgkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iJ+d86oJ0U4V6nwxeaoP2TUfWDbNzTtwNBrHghDujOcCD9ik/HeSdwYWd/MVxMOr3ZC4qPyPulgjzDztkHv2ibUMA07doDpvKi2VmIul3gsj/k9A/Xbu7XD6Lkigw1X5V3gHA1Ah0aM+zi0mIi/rurm37VRL9oo/Aji3j6omuS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ks9JTybr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eDsY1U9E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ks9JTybr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eDsY1U9E"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I60hT2362816
	for <linux-gpio@vger.kernel.org>; Fri, 18 Sep 2026 08:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QYCS+iH2jYyOJrRu1AhW0y/AISLrS+T3SnQPYRrrt3Q=; b=Ks9JTybrqc2lnucs
	y3ziplJwm7iDeWksqUsdq7pqq2FOoWFjLLJoUv0RogJDMf+Wy3lx7lec+DZERuFn
	vgMQX1b8LruQnv8O9dSG0MZRwv+LGG2tHazMqz+UnDy/y3chb6w91uRx+LuoPhWU
	jDKS7p1J5XO/1vTBGvtIYDmU79pzl6GAeZmVAqUhp1MshHYkroltMTPY3mWG7wEr
	s5e2fw79mMyDLXhfTBQ/7funrJyBNIdj/p2RCBjOCeX8A9ZBbFp07Wu7MXt8z34H
	Ey3k2tDtB7My/UwydZCa5NdF0XehRVqI8XsPKtV/LwNneeAIvFYM+xeJmBD2PPNf
	hKEJzg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grhs6m6fq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 18 Sep 2026 08:01:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e661ce1dcso10457685a.0
        for <linux-gpio@vger.kernel.org>; Fri, 18 Sep 2026 01:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789718461; x=1790323261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QYCS+iH2jYyOJrRu1AhW0y/AISLrS+T3SnQPYRrrt3Q=;
        b=eDsY1U9ElvBRL7ngUZrvhZ59ZerneF9ku6KKoi+ooVRcaYy2f6lf63UEEi223ZHQCM
         8HXJBfsQYcnfoPtqY5cdO54M4ivUFYI+zE4blqtdt8j/brCbmmmsbFhAJiUP+397vwEv
         h7qWo/iwr06sBx5LJhRdwXEw2lCFFE6DGfw1JkPlcgiPWMVDitnKsBlXimxV6vv559rm
         XdDusqioWIKn1PPdAxGnUNbf8qE5dsEzxV1pJqRtP4qj9lQ15y4F46hGucMRFUcDweQm
         ZSnd7j7//T7o0BUU2BmKdKaDcOrKepkxihfk8hDQZQ1gyCHoxwqATz55GAy9i5LDaon5
         NrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789718461; x=1790323261;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QYCS+iH2jYyOJrRu1AhW0y/AISLrS+T3SnQPYRrrt3Q=;
        b=h+TPD30L8MHv0sgrBtMuJUV5h4CRnT0LEdRsoXFjF23XmanHVAB2vemL4j2dkq6PLW
         DESl690oqzq6wvYIKSEBipgWEjRq5xxrb0VyGhZVL77Ek9xa5VP/t7dabDbUV4tQL8oz
         MiAnQGu5+RzjX0MDrZNrhGA62TZozkYJB5Wy5TOXOO+IA7dfkjqsUCCbEW7twBsTpSQa
         j4fcGWTFV1LeRQU3DQabO0ipG0S0+hXEPsVVBSjM4rHUchM0C/CZkz4El+G+o6AFWyIk
         3ROVqECj849NNQuIZnOlROBwuohx15qu56aUDpQOvRrhwgDab2sB0Qog/57Zg2klAbT8
         +0aA==
X-Forwarded-Encrypted: i=1; AKwUvBzzScN5QWN/An/04HmlkXV0FKP/ehi23De+fC+oQaSFJDWxXmIGmNPWWTwM1wOTZWjLETYsqxtaEL04@vger.kernel.org
X-Gm-Message-State: AFuF++lhTzp2MzNvVirjW9cCDtuIOEm+S1UByHuihxQ8lrPzqztDvjUJ
	pbKQR8auFFAfvpb4cpe4Zz1nuWUEH9vP05pR6kBnWnUpDVIwUU+8HzkNfGfy6WGMzdfMHcSJBMY
	aUye/C1D9GE5ouHUCJrJJZOLSDR1euHLgqM+wEHHzH3HFsV1OV8FUphbWL/16xW4+
X-Gm-Gg: AYBFou1E9g1GjrcPy34Vs4HhRHaS+dmYcya7Rfulj7i1m/PKkf2TVd+AqyrPdJ4cW1i
	S7QFTSS0GRhoSyFL1/9KMW40fwfUWpSDx3+XB5gv4simeuWGt2R8fGcKVaT06wf1ZHg3+i3nz5j
	v80yZpvFwEmJfBPzk3gtTWR7zKTf504CM236flQCAIkWJ9FbN7WZ0V4QcCQpn1ev5AMFLHxIc27
	ssBKEjfITezcuql8Tpg9sOMweQxbk93HC/Nio5SWqrJgdN4bkMOryXIIo/D36CnJ/svzjP++5ou
	2/yGsptTce+ATyNiSLCAgQMlKubBbRNUpZkf/WwWrLMuSjEZaX6Amcu8AWeDlJfK+aj5k2b9Lkc
	V4/GxIx9DjrWTJ0prkFrVdQ==
X-Received: by 2002:a05:620a:6888:b0:939:94c4:b799 with SMTP id af79cd13be357-93be074c4efmr151696285a.5.1789718461088;
        Fri, 18 Sep 2026 01:01:01 -0700 (PDT)
X-Received: by 2002:a05:620a:6888:b0:939:94c4:b799 with SMTP id af79cd13be357-93be074c4efmr151692185a.5.1789718460747;
        Fri, 18 Sep 2026 01:01:00 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb45b0fsm30000666b.35.2026.09.18.01.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 01:00:59 -0700 (PDT)
Message-ID: <8d32cbea-fd17-4f3a-aac1-6f44a50205e7@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 10:00:57 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: tlmm-test: Add const to reg_names
 allocation type
To: Kees Cook <kees@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Kees Cook <kees+treewide@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
References: <20260917211009.i.312-kees@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917211009.i.312-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEwOSBTYWx0ZWRfX3hZ087WI/DQH
 jgLAVnRzP+YjqOFQmMUU7Xzfas4fDoKMLMBRPQCM9IXTJ5nTwz1creFX18RJQmH6ONJgwK7p2rK
 +sqIYPdu/I6lPsAuOo2LVBVHDU5VRe56q0Gcoxd6T050zh1iurM6ZSL9nj9WjoqgfrqhDCQdSrj
 dwER+DXjMJ3gfiTy4OumVMB2v9lgVwnnqOEqREY3IZuk6sSf1hg/4yEUNDpcJd5R8LxERLz/E4b
 teyYSUGaS9tt7LFztQ49V+KBjBbtICIWHqwV/Sn2iKsECTPJ0DYHBy4GgiWdtG6VXls3O4gtpwK
 ThgrjMR3EpSO5UXkjMRdEjbfl2fPa8pavmW0065lT25hC/cvObhVUYOg61N9gITk6U00sCOGuMS
 8ms2omEdXwF8BNPWECxbCH1sZW8tz2eN3kWz+WsRncWoxOS+toOql0q5jN8buyRVnol/bdi3N76
 o8U6NIcTT7ea3Qj/RZQ==
X-Proofpoint-GUID: -5923m7pFkfE1ZFfpobV1bpRYGWl5NuH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEwOSBTYWx0ZWRfXxZXmTpwfVmS3
 VgVV0gdcNuTtVs8RS+DYsD2ADy0KhQCGlRDDtR70h+u6FLU+6ZcUAf334xMMOYxpPR4J1vcT9kX
 WYfrnmJ3ICWpfR+m20/MR3VIRh8ohXE=
X-Proofpoint-ORIG-GUID: -5923m7pFkfE1ZFfpobV1bpRYGWl5NuH
X-Authority-Analysis: v=2.4 cv=cvwOAF4i c=1 sm=1 tr=0 ts=6aacefbd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xPH-2WeAMKhyT3qgJ8UA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180109

On 9/17/26 11:10 PM, Kees Cook wrote:
> From: Kees Cook <kees+treewide@kernel.org>
> 
> In preparation for converting the kmalloc family of allocators to the
> type-aware kmalloc_obj family, we need to make sure that the returned
> type from the allocation matches the type of the variable being
> assigned. (The kmalloc family returns "void *", which can be implicitly
> cast to any pointer type.)
> 
> The assigned type is "const char **", but the converted allocation type
> would be "char **", which is the same type without the const qualifier.
> As there is no general way to safely add const qualifiers, take the size
> from the assignment target instead. No change in allocation size
> results.
> 
> Build tested ARCH=x86_64 allmodconfig with GCC 16.2.0:
> drivers/pinctrl/qcom/tlmm-test.o
> 
> Assisted-by: LLM coccinelle
> Signed-off-by: Kees Cook <kees+treewide@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
