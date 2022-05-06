package com.pts.Pojo;

import com.pts.Pojo.Candidate;
import com.pts.Pojo.Employer;
import javax.annotation.processing.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2022-02-17T19:58:47", comments="EclipseLink-2.7.9.v20210604-rNA")
@StaticMetamodel(Province.class)
public class Province_ { 

    public static volatile SingularAttribute<Province, String> level;
    public static volatile SingularAttribute<Province, String> name;
    public static volatile CollectionAttribute<Province, Employer> employerCollection;
    public static volatile SingularAttribute<Province, Integer> id;
    public static volatile SetAttribute<Province, Candidate> candidateCollection;

}